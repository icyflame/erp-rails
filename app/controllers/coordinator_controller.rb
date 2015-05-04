class CoordinatorController < ApplicationController
	before_action :authenticate_coordinator!
  def index
  	@thisID = current_coordinator.id

  	@coordinator = Coordinator.find(@thisID)

    @allAlums = Alumni.all()

    @allAlums.each do |alumni|
    	@tie = TieAlumniWithStudentMember.where({ :Alumni_id => "#{alumni.id}"})
    	# student_id = @tie[0].StudentMember_id
    	# student = StudentMember.find(student_id)
    end
  end

  def show
  end
end
