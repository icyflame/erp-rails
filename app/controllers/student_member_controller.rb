class StudentMemberController < ApplicationController
	before_action :authenticate_student_member!
  def index
  	# render plain: params.inspect
		# ensure that only student member who
		# is logged in can see his/her own
		# record.
    @thisID = current_student_member.id
    @student = StudentMember.find(@thisID)

    @allties = TieAlumniWithStudentMember.where("StudentMember_id = #{current_student_member.id}")

    @allalums = Array.new

    @allties.each do |this_tie|
    # puts Alumni.find(this_tie.Alumni_id).name
    @allalums.push(Alumni.find(this_tie.Alumni_id))
  end

  # render plain: @allties.inspect
  # render plain: AlumniStatus.where("Alumni_id = #{1}").inspect
end
end
