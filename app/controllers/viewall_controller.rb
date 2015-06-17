class ViewallController < ApplicationController
  def alumni
  	if not student_member_signed_in? and not coordinator_signed_in?
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
      return
    end

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
  	if not student_member_signed_in? and not coordinator_signed_in?
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
      return
    end

    @allStudents = StudentMember.all

    @allStatus = AlumniStatus.all

    @allTies = TieAlumniWithStudentMember.all
  end
end
