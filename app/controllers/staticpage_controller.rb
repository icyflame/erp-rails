class StaticpageController < ApplicationController
	def index
		
	end

	def createallusers

		AdminUser.create(email: 'admin@example.com', 
			password: 'password', 
			password_confirmation: 'password')

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

		lastid = Alumni.all.count

		for i in 1..10
			j = lastid + i
			Alumni.create(
				id: j.to_s,
				name: 'Default User ' + i.to_s,
				year: '201' + i.to_s,
				hall: 'SH',
				department: 'alumdep' + i.to_s
				)
		end

		render plain: "Done!"
		
	end
end
