class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user_to_change

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def id
    params.require(:id)
  end

  def set_user_to_change
    return @user = current_user if params[:user_id].nil?
    return @user = User.find(params.require(:user_id)) if current_user.is_admin?
    
    render status: :forbidden, json: { message: 'Utilizador não tem permissões para aceder' }
  end
end
