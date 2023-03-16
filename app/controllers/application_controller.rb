class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_out_path_for(resource)
    new_employee_session_path 
  end

  def after_sign_in_path_for(resource)
    root_path 
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :name, :address, :gender, :dob, :phone_number, :designation, :date_of_joining, :department_id])
  end 
end
