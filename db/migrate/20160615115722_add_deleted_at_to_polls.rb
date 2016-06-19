class AddDeletedAtToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :deleted_at, :time
  end
end
