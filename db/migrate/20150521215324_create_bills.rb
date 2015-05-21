class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.text :description
      t.text :imageurl
      t.float :amount
      t.text :dateofpurchase

      t.timestamps
    end
  end
end
