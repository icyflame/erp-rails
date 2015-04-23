class CoordinatorController < ApplicationController
<<<<<<< HEAD
	before_action :authenticate_coordinator!
  def index
  	@thisID = current_coordinator.id

  	@coordinator = Coordinator.find(@thisID)
  end

  def show
  end
=======
	def index
		
	end
>>>>>>> 74dc2b064480b6dc39127268a6e780907fab2d82
end
