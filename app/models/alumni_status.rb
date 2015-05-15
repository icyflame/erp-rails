class AlumniStatus < ActiveRecord::Base
	belongs_to :Alumni
	enum search: [:ready, :found, :tobesearched, :dumped]
	enum response: [:positive, :negative, :neutral, :registered, :default]

	after_create :init

	def init
	  self.tobesearched!
	  self.default!
	end

end
