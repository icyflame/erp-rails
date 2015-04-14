class AlumniController < ApplicationController
  def index
  end

  def show
  	@thisID = params[:id]
  	@alum = Alumni.find(@thisID)
  	@astat = AlumniStatus.find_by_Alumni_id(@thisID)

  	@alumni_data = AlumniData.find_by_Alumni_id(@thisID)
    @editingAllowed = false
    @assignedtoid = -1

    if @tie = TieAlumniWithStudentMember.find_by_Alumni_id(@thisID)
      @assignedtoid = @tie.StudentMember_id
      if @assignedtoid == current_student_member.id
        @editingAllowed = true
      end
    else
      render plain: "This alumni has not been allotted to anyone yet. Contact the SysAdmin."
    end

  	# render plain: @alumni_data.inspect

  	# render plain: @astat.inspect
  end
end
