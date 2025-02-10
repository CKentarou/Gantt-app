class ApplicationController < ActionController::Base
  # Deviseコントローラーの場合、許可されたパラメーターを設定する
  before_action :configured_permitted_parameters, if: :devise_controller?
  
  # ユーザー認証を行う。ただし、トップページとアバウトページは除く
  before_action :authenticate_user!, except: [:top, :about]

  protected

  # サインイン後のリダイレクト先を設定する
  def after_sign_in_path_for(resource)
    root_path
  end

  # サインアウト後のリダイレクト先を設定する
  def after_sign_out_path_for(resource)
    root_path
  end

  # サインアップ時に許可するパラメーターを設定する
  def configured_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
