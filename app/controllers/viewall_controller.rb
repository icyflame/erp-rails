class ViewallController < ApplicationController
  def alumni
  	if not student_member_signed_in? and not coordinator_signed_in?

  		render plain: "You don't have privileges to see this page."

  	end

  	@allAlums = Alumni.all
  end

  def students
  	## TODO: BY hiten
  end
end
