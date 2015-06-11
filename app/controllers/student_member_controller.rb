class StudentMemberController < ApplicationController
	before_action :authenticate_student_member!
  def index
  	# render plain: params.inspect
		# ensure that only student member who
		# is logged in can see his/her own
		# record.
    @thisID = current_student_member.id

    @allties = TieAlumniWithStudentMember.where({ :studentmember_id => "#{current_student_member.id}" })

    # @allties = TieAlumniWithStudentMember.where(" \"studentmember_id\" = #{current_student_member.id}")

    @allalums = Array.new

    @allties.each do |this_tie|

      @allalums.push(Alumni.find(this_tie.alumni_id))
      
    end

  end
end
