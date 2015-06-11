class AlumniDataController < ApplicationController
	def update
		if student_member_signed_in?
			if @tie = TieAlumniWithStudentMember.where({studentmember_id: current_student_member.id, alumni_id: params[:alum_id]})

				# render plain: @tie.inspect
				# return
				# assert_equal @tie.alumni_id.to_i, params[:id].to_i

				@alumni_data = AlumniData.find(params[:alum_id])

				if @alumni_data.update(alumni_data_params)
					render(:file => File.join(Rails.root, 'public/200.html'), :status => 200, :layout => false)
					return
				else
					puts "Found TIE Object, but couldn't update in DB"
					render(:file => File.join(Rails.root, 'public/500.html'), :status => 500, :layout => false)
					return
				end

			else

				puts "Allotted to someone else"
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
