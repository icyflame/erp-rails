class StudentMemberController < ApplicationController
  def index
    if not student_member_signed_in?

      render plain: "You don't have permissions to view this page."
  	# render plain: params.inspect
		# ensure that only student member who
		# is logged in can see his/her own
		# record.
    @thisID = current_student_member.id

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
