class Hackers::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token
  prepend_before_filter :require_no_authentication, :only => [:create ]
  before_filter :ensure_params_exist

  respond_to :json

  # NOTE: Right now the way I am creating the auth tokens is kinda dumb
  # There is only one token and it is not session specific, but for now
  # it works fine. Better way would be to create tokens that will at least
  # time out after a certain time

  # POST /resource/sign_in
  def create
    resource = Hacker.find_for_database_authentication(
      :email => params[:login]
    )
    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:password])
      render :json=> {:success=>true, :auth_token=>resource.authentication_token, :email=>resource.email}
      return
    end

    invalid_login_attempt
  end

  # DELETE /resource/sign_out
  def destroy

  end

  protected

  def ensure_params_exist
    return unless params[:login].blank?
    return unless params[:password].blank?
    render :json=>{:success=>false, :message=>"missing login or password parameter"}, :status=>422
  end
 
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>401
  end
end
