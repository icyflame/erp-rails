class SponsorsController < ApplicationController
  before_filter :ensure_signed_in

  def show
    if student_member_signed_in?
      @allSponsors = Sponsor.where(:associate_role => 'student_member')
    else
      @allSponsors = Sponsor.all
    end
  end

  def view
    @sponsor = Sponsor.find(params[:id])
  end

  def new
    if student_member_signed_in?
      @current_id = current_student_member.id
      @current_role = 'student_member'
    elsif coordinator_signed_in?
      @current_id = current_coordinator.id
      @current_role = 'coordinator'
    end
  end

  def create
    @sponsor = Sponsor.new

		if @sponsor.update(sponsor_params)
			redirect_to sponsors_path, :notice => 'New sponsor ' + params[:sponsor][:company] + ' has been created.'
			return
		else
			puts "Could not update in the DB"
			render(:file => File.join(Rails.root, 'public/500.html'), :status => 500, :layout => false)
			return
		end
  end

  def update
    @sponsor = Sponsor.find(params[:id])
  end

  def edit
    @sponsor = Sponsor.find(params[:id])

		if @sponsor.update(sponsor_params)
			redirect_to sponsors_path, :notice => 'Sponsor: ' + Sponsor.find(params[:id]).company + ' has been updated.'
			return
		else
			puts "Could not update in the DB"
			render(:file => File.join(Rails.root, 'public/500.html'), :status => 500, :layout => false)
			return
		end
  end

  private
	def sponsor_params
		params.require(:sponsor).permit(Sponsor.column_names - ["id", "created_at", "updated_at"])
	end
end
