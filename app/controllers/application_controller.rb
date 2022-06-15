class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_id])
    @user = User.find_by(params[:id])

    added_attrs = %i[email name password password_confirmation avatar remove_avatar]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs

    # 未実装 マイページを編集した後のリダイレクト先を変更したい
    # def after_sign_up_path_for(resource)
    #   contents_path

    # end

    # def after_update_path_for(resource)
    #   contents_path
    # end
  end
end
