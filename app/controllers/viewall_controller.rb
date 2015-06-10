class ViewallController < ApplicationController
  def alumni
  	if not student_member_signed_in? and not coordinator_signed_in?

      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
      return


    end

    @allAlums = Alumni.all
  end

  def students
  	if not student_member_signed_in? and not coordinator_signed_in?
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
      return

    end

    @allStudents = StudentMember.all
  end
end
