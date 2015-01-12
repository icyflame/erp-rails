class CreateAlumniData < ActiveRecord::Migration
  def change
    create_table :alumni_data do |t|
      t.references :Alumni, index: true
      t.string :company
      t.string :designation
      t.string :home_address
      t.string :office_address
      t.string :home_phone
      t.string :office_phone
      t.string :mobile_phone

      t.timestamps
    end
  end
end
