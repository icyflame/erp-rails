class AddPaymentToAlumniData < ActiveRecord::Migration
  def change
    add_column :alumni_data, :payment_details, :string
  end
end
