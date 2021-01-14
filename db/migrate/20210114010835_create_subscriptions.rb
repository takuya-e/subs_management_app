class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :service_name, null: false
      t.string :genre, null: false
      t.float :contractcycle_month
      t.float :contractcycle_year
      t.float :monthly_fee
      t.float :annual_fee
      t.timestamps
    end
  end
end
