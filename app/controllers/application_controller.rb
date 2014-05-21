class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    ## Permit the custom fields below which you would like to update, I have shown a few examples 
    devise_parameter_sanitizer.for(:account_update) << :LastName << :firstName
    devise_parameter_sanitizer.for(:sign_up) << :LastName << :firstName << :avatar
  end   
  protect_from_forgery with: :exception
  def avatar_url(user)
  if user.avatar_url.present?
    user.avatar_url
  else
    default_url = "#{root_url}images/guest.png"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end

end

end
