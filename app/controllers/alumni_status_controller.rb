class AlumniStatusController < ApplicationController
	def updatesearch

		@astat = AlumniStatus.where({ :Alumni_id => params[:id] })[0]

		AlumniStatus.update(@astat.id, :search => params[:setsearch].to_i)

		# @t = AlumniStatus.find_by_Alumni_id(params[:id])

		# render plain: @t.inspect

	end

	def updateresponse

		@astat = AlumniStatus.where({ :Alumni_id => params[:id] })[0]

		AlumniStatus.update(@astat.id, :response => params[:setresponse].to_i)

	end
end
