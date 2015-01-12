class CreateAlumniStatuses < ActiveRecord::Migration
  def change
    create_table :alumni_statuses do |t|
      t.references :Alumni, index: true
      t.integer :search
      t.integer :response

      t.timestamps
    end
  end
end
