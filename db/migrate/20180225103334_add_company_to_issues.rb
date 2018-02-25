class AddCompanyToIssues < ActiveRecord::Migration[5.2]
  def change
    add_reference :issues, :company, foreign_key: true
  end
end
