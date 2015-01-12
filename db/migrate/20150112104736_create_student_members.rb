class CreateStudentMembers < ActiveRecord::Migration
  def change
    create_table :student_members do |t|
      t.string :name
      t.string :rollnum
      t.string :portfolio

      t.timestamps
    end
  end
end
