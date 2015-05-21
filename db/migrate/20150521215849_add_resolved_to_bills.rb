class AddResolvedToBills < ActiveRecord::Migration
  def change
    add_column :bills, :resolved, :boolean
  end
end
