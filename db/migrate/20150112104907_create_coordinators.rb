class CreateCoordinators < ActiveRecord::Migration
  def change
    create_table :coordinators do |t|
      t.string :name
      t.string :rollnum
      t.string :portfolio

      t.timestamps
    end
  end
end
