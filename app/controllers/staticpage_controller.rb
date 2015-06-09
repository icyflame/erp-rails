class StaticpageController < ApplicationController
	def index
		
	end

	def createallusers

		if not AdminUser.where(email: "admin@example.com").length > 0

			AdminUser.create(email: 'admin@example.com', 
				password: ENV['ADMIN_USER_PASSWORD'], 
				password_confirmation: ENV['ADMIN_USER_PASSWORD'])

		end

		puts "AdminUser created"

		StudentMember.create(id: '0',
			name: 'Default User', 
			rollnum: '15DF12345',
			portfolio: 'Default Portfolio',
			email: 'student@example.com', 
			password: ENV['ADMIN_USER_PASSWORD'], 
			password_confirmation: ENV['ADMIN_USER_PASSWORD'])

		Coordinator.create(id: '0',
			name: 'Default User',
			rollnum: '15DF12346',
			portfolio: 'Default Portfolio',
			email: 'coordinator@example.com', 
			password: ENV['ADMIN_USER_PASSWORD'], 
			password_confirmation: ENV['ADMIN_USER_PASSWORD'])

		render plain: "Done!"
		
	end
end
