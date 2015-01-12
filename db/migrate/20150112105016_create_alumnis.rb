class CreateAlumnis < ActiveRecord::Migration
  def change
    create_table :alumnis do |t|
      t.string :name
      t.string :year
      t.string :hall

      t.timestamps
    end
  end
end
