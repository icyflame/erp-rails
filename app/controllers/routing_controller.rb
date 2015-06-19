class RoutingController < ApplicationController
	def index
		if student_member_signed_in?
			redirect_to "/homepage/studentmember/"
		elsif coordinator_signed_in?
			redirect_to "/homepage/coordinator/"
		elsif registered_alumni_signed_in?
			redirect_to "/information"
		else
			redirect_to "/homepage/"
		end
	end
end
