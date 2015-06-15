class CoordinatorController < ApplicationController
	before_action :authenticate_coordinator!
  def index
  	@thisID = current_coordinator.id

  	@coordinator = Coordinator.find(@thisID)

    # @allAlums = Alumni.all()

    h = AlumniStatus.searches
    @search_all = Array.new
    h.each do |key, val|
      @search_all.push(key)
    end

    h = AlumniStatus.responses
    @response_all = Array.new
    h.each do |key, val|
      @response_all.push(key)
    end

    @allAlums = Alumni.select("*").joins(:AlumniData, :AlumniStatus, :TieAlumniWithStudentMember)

  end

  def show
  end
end
