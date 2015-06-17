class ApplicationController < ActionController::Base

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception
  def redirect_to_login_if_not_admin
    unless current_user.admin?
      redirect_to new_user_session_path and return
    end
  end
end
