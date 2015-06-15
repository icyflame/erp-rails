class StudentMemberController < ApplicationController
	before_action :authenticate_student_member!
  def index
  	# render plain: params.inspect
		# ensure that only student member who
		# is logged in can see his/her own
		# record.
    @thisID = current_student_member.id

    @allalums = Array.new

    h = AlumniStatus.searches
    @search_all = Array.new
    h.each do |key, val|
      @search_all.push(key)
    end

    h = AlumniStatus.responses
    @response_all = Array.new
    h.each do |key, val|
      @response_all.push(key)
    end

    @allalums = Alumni.select("*").where("tie_alumni_with_student_members.studentmember_id = #{current_student_member.id}").joins(:AlumniData, :AlumniStatus, :TieAlumniWithStudentMember)

  end
end
