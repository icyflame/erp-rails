class RegisteredAlumniController < ApplicationController
	layout "information"
	before_action :authenticate_registered_alumni!
  def show
  end
end
