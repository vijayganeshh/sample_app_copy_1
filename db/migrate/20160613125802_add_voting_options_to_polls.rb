class AddVotingOptionsToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :yes, :integer
    add_column :polls, :no, :integer
  end
end
