class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :company
      t.string :type
      t.string :person
      t.string :mobile_phone
      t.string :office_phone
      t.string :email1
      t.string :email2
      t.string :designation
      t.string :alumnus
      t.string :batch
      t.string :dept
      t.string :hall
      t.string :first_date
      t.string :comments
      t.string :next_date
      t.string :proposal_sent
      t.string :remarks
      t.string :status

      t.timestamps
    end
  end
end
