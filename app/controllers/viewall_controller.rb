class ViewallController < ApplicationController
  before_filter :authenticate_coordinator!

  def alumni
    @allAlums = Alumni.select("*").joins(:AlumniData, :AlumniStatus, :TieAlumniWithStudentMember)

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
  end

  def students
    @allStudents = StudentMember.all

    @allStatus = AlumniStatus.all

    @allTies = TieAlumniWithStudentMember.all
  end

  def paid
    @allAlums = Alumni.joins(:AlumniStatus)
    .where(alumni_statuses: { response: AlumniStatus.responses[:paid] } )
  end

  def year
    @allAlums = Alumni.select("*").joins(:AlumniData, :AlumniStatus, :TieAlumniWithStudentMember)
                                  .where(:year => params[:year])

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
  end
end
