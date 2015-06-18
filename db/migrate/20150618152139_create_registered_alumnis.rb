class CreateRegisteredAlumnis < ActiveRecord::Migration
  def change
    create_table :registered_alumnis do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.string :mobile
      t.string :dob
      t.string :married
      t.string :industry
      t.string :profession
      t.string :org_name
      t.string :designation
      t.string :org_city
      t.string :org_state
      t.string :org_country
      t.string :org_zip
      t.string :org_address
      t.string :roll_number
      t.string :join_year
      t.string :degree
      t.string :department
      t.string :hall
      t.string :year_of_graduating
      t.references :Alumni, index: true

      t.timestamps
    end
  end
end
