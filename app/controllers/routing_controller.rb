class RoutingController < ApplicationController
	def index
		if student_member_signed_in?
			redirect_to "/homepage/studentmember/"
		else
			if coordinator_signed_in?
				redirect_to "/homepage/coordinator/"
			else
				redirect_to "/homepage/"
			end
		end	
	end
end
