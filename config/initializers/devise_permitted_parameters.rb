module DevisePermittedParameters
  extend ActiveSupport::Concern

  include do
    before_action :configure_permitted_parameters
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :profile_name]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :profile_name]
  end

end

DeviseController.send :include, DevisePermittedParameters
