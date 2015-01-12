class AlumniController < ApplicationController
  def index
  end

  def show
  	@thisID = params[:id]
  	@alum = Alumni.find(@thisID)
  	@astat = AlumniStatus.find_by_Alumni_id(@thisID)

  	# render plain: @astat.inspect
  end
end
