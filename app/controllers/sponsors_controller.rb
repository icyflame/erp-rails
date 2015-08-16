class SponsorsController < ApplicationController
  before_filter :ensure_signed_in

  def show
    @allSponsors = Sponsor.all
  end

  def new
  end

  def create
    @sponsor = Sponsor.new

		if @sponsor.update(sponsor_params)
			render(:file => File.join(Rails.root, 'public/201.html'), :status => 201, :layout => false)
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
			render(:file => File.join(Rails.root, 'public/200.html'), :status => 201, :layout => false)
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
