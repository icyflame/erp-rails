class AlumniDataController < ApplicationController
	def update
		if student_member_signed_in?
			if @tie = TieAlumniWithStudentMember.find_by_StudentMember_id(current_student_member.id)
				if params[:id].to_i == @tie.Alumni_id
					
					@alumni_data = AlumniData.find(params[:id])

					if @alumni_data.update(alumni_data_params)
						render(:file => File.join(Rails.root, 'public/200.html'), :status => 200, :layout => false)
						return
					else
						render(:file => File.join(Rails.root, 'public/200.html'), :status => 200, :layout => false)
						return
					end
					# render plain: "This studmem has permissions to edit the Alumni."

				else
					render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
					return	
				end
			else
				render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
				return
			end
		end		
	end

	private
	def alumni_data_params
		params.require(:alumni_data).permit(AlumniData.column_names)
	end
end
