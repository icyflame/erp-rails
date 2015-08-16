class AddRoleColumnToCoordinators < ActiveRecord::Migration
  def self.up
    add_column :coordinators, :coordinator, :boolean, :default => true
  end
end
