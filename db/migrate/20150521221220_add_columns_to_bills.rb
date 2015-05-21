class AddColumnsToBills < ActiveRecord::Migration
  def change
    add_column :bills, :userid, :integer
    add_column :bills, :usertype, :integer
  end
end
