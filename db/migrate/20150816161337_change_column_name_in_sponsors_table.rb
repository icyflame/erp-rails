class ChangeColumnNameInSponsorsTable < ActiveRecord::Migration
  def self.up
  	rename_column :sponsors, :type, :type_of_sponsorship
  end
end
