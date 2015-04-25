class AddDefaultStudentAndCoordinator < ActiveRecord::Migration
	def migrate(direction)
		super
    # Create default users
    StudentMember.create!(id: '0',
    	name: 'Default User', 
    	rollnum: '15DF12345',
    	portfolio: 'Default Portfolio',
    	email: 'student@example.com', 
    	password: 'password', 
    	password_confirmation: 'password') if direction == :up

    Coordinator.create!(id: '0',
    	name: 'Default User',
    	rollnum: '15DF12346',
    	portfolio: 'Default Portfolio',
    	email: 'coordinator@example.com', 
    	password: 'password', 
    	password_confirmation: 'password') if direction == :up
  end

  def change
  end
end
