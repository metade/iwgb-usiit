class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :name
      t.references :meeting, foreign_key: true

      t.timestamps
    end
  end
end
