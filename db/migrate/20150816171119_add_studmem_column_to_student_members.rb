class AddStudmemColumnToStudentMembers < ActiveRecord::Migration
  def change
    add_column :student_members, :studmem, :boolean, :default => true
  end
end
