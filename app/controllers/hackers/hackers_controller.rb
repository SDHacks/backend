class Hackers::HackersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!

  respond_to :json

  # GET /hacker
  def show
    render json: {
      success: true,
      email: @hacker.email
    }
  end

  # GET /hacker/resume
  def download_resume 
    resume = @hacker.resume

    if resume.nil?
      return render json: {success: false, message: "Resume not uploaded yet"}
    end

    send_data resume, filename: "resume.pdf", type: "pdf", disposition: 'attachment'
  end

  # POST /hacker/resume
  def upload_resume
    resume = params[:resume].read

    if resume.nil?
      return render json: {success: false, message: "Resume failed to upload"}
    end

    @hacker.resume = resume
    @hacker.save

    return render json: {success: true, message: "Resume uploaded succsessfully"}
  end

  def authenticate_user_from_token!
    hacker_token = request.headers['X-Hacker-Token']
    if hacker_token.blank?
      return render json: {success: false, message: "X-Hacker-Token header is missing"}
    end

    # Finding the hacker by the given token
    @hacker = Hacker.find_by_authentication_token(hacker_token.to_s)
    if @hacker.nil?
      return render json: {success: false, message: "Given Hacker-Token is invalid"}
    end
  end
end
