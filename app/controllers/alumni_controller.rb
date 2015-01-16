class AlumniController < ApplicationController
  def index
  end

  def show
  	@thisID = params[:id]
  	@alum = Alumni.find(@thisID)
  	@astat = AlumniStatus.find_by_Alumni_id(@thisID)

  	@alumni_data = AlumniData.find_by_Alumni_id(@thisID)

    if @tie = TieAlumniWithStudentMember.find_by_StudentMember_id(current_student_member.id)
      @assignedtoid = @tie.Alumni_id
    end

  	# render plain: @alumni_data.inspect

  	# render plain: @astat.inspect
  end
end
