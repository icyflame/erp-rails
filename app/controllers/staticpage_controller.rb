class StaticpageController < ApplicationController
	def index
	end

	def createallusers

		if not AdminUser.where(email: "admin@example.com").length > 0

			AdminUser.create(email: 'admin@example.com', 
				password: 'password', 
				password_confirmation: 'password')

		end

		puts "AdminUser created"

		StudentMember.create(id: '0',
			name: 'Default User', 
			rollnum: '15DF12345',
			portfolio: 'Default Portfolio',
			email: 'student@example.com', 
			password: 'password', 
			password_confirmation: 'password')

		Coordinator.create(id: '0',
			name: 'Default User',
			rollnum: '15DF12346',
			portfolio: 'Default Portfolio',
			email: 'coordinator@example.com', 
			password: 'password', 
			password_confirmation: 'password')

		# for i in 0..10
		# 	a = Alumni.new
		# 	a.name = "Something " + i.to_s
		# 	a.hall = "DF"
		# 	a.department = "FH"
		# 	a.year = "1966"
		# 	a.save!
		# end

		render(:file => File.join(Rails.root, 'public/201.html'), :status => 201, :layout => false)
		return
		
	end
end
