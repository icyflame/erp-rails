class AlumniController < ApplicationController
  def index
  end

  def show

    ensure_signed_in

  	@thisID = params[:id]
    @alum = Alumni.select("*").joins(:AlumniData, :AlumniStatus, :TieAlumniWithStudentMember).find(@thisID)
  	# @alum = Alumni.find(@thisID)
  	# @astat = AlumniStatus.find_by_alumni_id(@thisID)

  	@alumni_data = AlumniData.find_by_alumni_id(@thisID)

    @editingAllowed = false
    @assignedtoid = -1

    if @tie = TieAlumniWithStudentMember.find_by_alumni_id(@thisID)
      @assignedtoid = @tie.studentmember_id
      if student_member_signed_in? && @assignedtoid == current_student_member.id
        @editingAllowed = true
      end
    else
      render plain: "This alumni has not been allotted to anyone yet. Contact the SysAdmin."
    end

  	# render plain: @alumni_data.inspect

  	# render plain: @astat.inspect
  end
end
