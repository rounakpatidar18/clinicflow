class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_user, :current_clinic

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_clinic
    current_user&.clinic
  end

  def require_login
    redirect_to login_path unless current_user
  end
end
