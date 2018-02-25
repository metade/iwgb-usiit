class AddCompanyToVotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :company, foreign_key: true
  end
end
