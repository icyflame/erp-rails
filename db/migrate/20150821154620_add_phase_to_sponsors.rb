class AddPhaseToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :phase, :string
    add_column :sponsors, :remarks_about_phase, :string
  end
end
