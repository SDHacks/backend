class Hackers::HackersController < ApplicationController
  skip_before_filter :verify_authenticity_token
  # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!

  respond_to :json

  # All theese methods require an authentification token in the request header
  # the header key is "X-Hacker-Token"
  #
  # Refer to session_controller on how to get the token

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

    send_data resume[:resume], filename: "resume.pdf", type: "pdf", disposition: 'attachment'
  end

  # POST /hacker/resume
  # Post a form with a resume parameter containing the resume file in a multipart upload form
  def upload_resume
    resume = params[:resume]

    if resume.nil?
      return render json: {success: false, message: "Resume failed to upload"}
    end
    
    resume_content = resume.read
    resume_old = @hacker.resume

    if resume_old.nil?
      @hacker.build_resume(resume: resume_content)
    else
      resume_old.resume = resume_content
      resume_old.save
    end
    @hacker.save

    return render json: {success: true, message: "Resume uploaded succsessfully"}
  end

  def authenticate_user_from_token!
    hacker_token = request.headers['X-Hacker-Token']
    if hacker_token.blank?
      return render json: {success: false, message: "Authentification token missing"}
    end

    # Finding the hacker by the given token
    @hacker = Hacker.find_by_authentication_token(hacker_token.to_s)
    if @hacker.nil?
      return render json: {success: false, message: "Authentification token is invalid"}
    end
  end
end
