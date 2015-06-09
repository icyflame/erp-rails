class AddColumnsToAlumniData < ActiveRecord::Migration
  def change
    add_column :alumni_data, :email1, :string
    add_column :alumni_data, :email2, :string
  end
end
