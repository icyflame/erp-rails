class AlumniDataController < ApplicationController
	def update

		# render plain: params.inspect
		@alumni_data = AlumniData.find(params[:id])

		if @alumni_data.update(alumni_data_params)
			# render plain: "Update has been completed."
			if student_member_signed_in?
				if @tie = TieAlumniWithStudentMember.find_by_StudentMember_id(current_student_member.id)
					if params[:id].to_i == @tie.Alumni_id
						render plain: "This studmem has permissions to edit the Alumni."
					else
						render plain: "This studmem does not permissions to edit the Alumni."
					end
				else
					render plain: "This studmem does not permissions to edit the Alumni."
				end

			end
		else
			render "Update could not be completed."
		end
	end

	private
	def alumni_data_params
		params.require(:alumni_data).permit(AlumniData.column_names)
	end
end
