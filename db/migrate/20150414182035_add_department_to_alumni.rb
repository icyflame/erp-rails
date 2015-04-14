class AddDepartmentToAlumni < ActiveRecord::Migration
  def change
    add_column :alumnis, :department, :string
  end
end
