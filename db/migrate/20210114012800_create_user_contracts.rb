class CreateUserContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_contracts do |t|
      t.date :contract_date, null: false
      t.date :cancellation_date
      t.references :user, foreign_key: true
      t.references :subscription, foreign_key: true
      t.timestamps
    end
  end
end
