class AlumniDataController < ApplicationController
	def update
		# render plain: params.inspect
		@alumni_data = AlumniData.find(params[:id])

		if @alumni_data.update(alumni_data_params)
			render plain: "Update has been completed."
		else
			render "Update could not be completed."
		end
	end

	private
	def alumni_data_params
		params.require(:alumni_data).permit(AlumniData.column_names)
	end
end
