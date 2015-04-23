class CoordinatorController < ApplicationController
	before_action :authenticate_coordinator!
  def index
  	@thisID = current_coordinator.id

  	@coordinator = Coordinator.find(@thisID)

    @allAlums = Alumni.all()
  end

  def show
  end
end
