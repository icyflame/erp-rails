class AddColumnToAlumniData < ActiveRecord::Migration
  def change
    add_column :alumni_data, :call_next_at, :string, default: "2016-01-23 09:00"
  end
end
