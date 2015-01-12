class CreateTieAlumniWithStudentMembers < ActiveRecord::Migration
  def change
    create_table :tie_alumni_with_student_members do |t|
      t.references :Alumni, index: true
      t.references :StudentMember, index: true

      t.timestamps
    end
  end
end
