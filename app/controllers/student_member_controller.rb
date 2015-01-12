class StudentMemberController < ApplicationController
  def index
  	render plain: params.inspect
  end

  def show
  	# render plain: params.inspect
  	@thisID = params[:id]
  end
end
