class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.text :topic
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :polls, [:user_id, :created_at]
  end
end
