class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :poll, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :votes, [:poll_id, :user_id], unique: true
  end
end
