class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.references :subscription, foreign_key: true
      t.timestamps
    end
  end
end
