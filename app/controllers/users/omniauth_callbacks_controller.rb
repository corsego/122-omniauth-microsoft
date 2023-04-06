class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def azure_activedirectory_v2
    data = request.env['omniauth.auth']['info']
    @user = User.find_by(email: data['email'])
    @user ||= User.create(
      email: data['email'],
      password: Devise.friendly_token[0, 20],
      uid: request.env['omniauth.auth']['uid'],
      provider: request.env['omniauth.auth']['provider']
    )
    if @user.persisted?
      flash[:notice] = "success"
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:notice] = "failure"
      redirect_to new_user_registration_url
    end
  end
end