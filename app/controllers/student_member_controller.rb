class StudentMemberController < ApplicationController
	before_action :authenticate_student_member!
  def index
  	# render plain: params.inspect
		# ensure that only student member who
		# is logged in can see his/her own
		# record.
  	@thisID = current_student_member.id
  end

  def show
  end
end
