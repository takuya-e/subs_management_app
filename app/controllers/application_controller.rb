class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :index
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  #登録時のnameの許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  #ログイン後の飛び先指定
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

end
