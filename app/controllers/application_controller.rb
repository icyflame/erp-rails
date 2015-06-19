class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  	devise_parameter_sanitizer.for(:sign_up) << :rollnum
  	devise_parameter_sanitizer.for(:sign_up) << :portfolio

  	devise_parameter_sanitizer.for(:account_update) << :name
  	devise_parameter_sanitizer.for(:account_update) << :rollnum

    # registered alumni

    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:account_update) << :address
    devise_parameter_sanitizer.for(:account_update) << :city
    devise_parameter_sanitizer.for(:account_update) << :state
    devise_parameter_sanitizer.for(:account_update) << :country
    devise_parameter_sanitizer.for(:account_update) << :zip_code
    devise_parameter_sanitizer.for(:account_update) << :mobile
    devise_parameter_sanitizer.for(:account_update) << :dob
    devise_parameter_sanitizer.for(:account_update) << :married
    devise_parameter_sanitizer.for(:account_update) << :org_industry
    devise_parameter_sanitizer.for(:account_update) << :org_profession
    devise_parameter_sanitizer.for(:account_update) << :org_name
    devise_parameter_sanitizer.for(:account_update) << :org_designation
    devise_parameter_sanitizer.for(:account_update) << :org_city
    devise_parameter_sanitizer.for(:account_update) << :org_state
    devise_parameter_sanitizer.for(:account_update) << :org_country
    devise_parameter_sanitizer.for(:account_update) << :org_zip
    devise_parameter_sanitizer.for(:account_update) << :org_address
    devise_parameter_sanitizer.for(:account_update) << :insti_roll_number
    devise_parameter_sanitizer.for(:account_update) << :insti_join_year
    devise_parameter_sanitizer.for(:account_update) << :insti_degree
    devise_parameter_sanitizer.for(:account_update) << :insti_department
    devise_parameter_sanitizer.for(:account_update) << :insti_hall
    devise_parameter_sanitizer.for(:account_update) << :insti_year_of_graduating

    devise_parameter_sanitizer.for(:account_update) << :email
    devise_parameter_sanitizer.for(:account_update) << :alumni_id
  end

  # CanCan Override

  def current_authenticated_resource
    if student_member_signed_in?
      current_student_member
    elsif coordinator_signed_in?
      current_coordinator
    end
  end

  # in ApplicationController
  def current_ability
    @current_ability ||= Ability.new(current_authenticated_resource)
  end
end
