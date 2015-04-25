class StaticpageController < ApplicationController
	def index
		
	end

	def createallusers

		AdminUser.first_or_create!(email: 'admin@example.com', 
			password: 'password', 
			password_confirmation: 'password')

		StudentMember.first_or_create!(id: '0',
			name: 'Default User', 
			rollnum: '15DF12345',
			portfolio: 'Default Portfolio',
			email: 'student@example.com', 
			password: 'password', 
			password_confirmation: 'password')

		Coordinator.first_or_create!(id: '0',
			name: 'Default User',
			rollnum: '15DF12346',
			portfolio: 'Default Portfolio',
			email: 'coordinator@example.com', 
			password: 'password', 
			password_confirmation: 'password')

		render plain: "Done!"
		
	end
end
