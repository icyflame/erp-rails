class Bill < ActiveRecord::Base
	'''
	TODO by Siddharth
	
	necessary filters regarding the bill need to be added here.
	'''

	enum usertype: [:studentmember, :coordinator]

	after_create :init

	def init
		self.studentmember!
	end

end
