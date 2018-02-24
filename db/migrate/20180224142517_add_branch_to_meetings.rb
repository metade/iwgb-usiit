class AddBranchToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_reference :meetings, :branch, foreign_key: true
  end
end
