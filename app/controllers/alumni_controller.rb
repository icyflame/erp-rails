class AlumniController < ApplicationController
  def index
  end

  def show
  	@thisID = params[:id]
  	@alum = Alumni.find(@thisID)
  	@astat = AlumniStatus.find_by_Alumni_id(@thisID)

  	@alumni_data = AlumniData.find_by_Alumni_id(@thisID)

  	# render plain: @alumni_data.inspect

  	# render plain: @astat.inspect
  end
end
