class RegisteredAlumnis::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  layout "basic"

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  def configure_account_update_params
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

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    edit_registered_alumni_registration_path
  end

  # update the resource without passwords
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
