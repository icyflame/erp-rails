class AddRoleAndAssociationToSponsor < ActiveRecord::Migration
  def change
    add_column :sponsors, :associate_id, :string
    add_column :sponsors, :associate_role, :string
  end
end
