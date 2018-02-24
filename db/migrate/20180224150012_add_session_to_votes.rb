class AddSessionToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :session, :string
    change_column :votes, :session, :string, null: false
  end
end
