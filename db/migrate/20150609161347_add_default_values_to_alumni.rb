class AddDefaultValuesToAlumni < ActiveRecord::Migration
  def change
  	change_column :alumnis, :hall, :string, default: "Unknown"
  end
end
