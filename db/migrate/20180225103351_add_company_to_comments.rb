class AddCompanyToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :company, foreign_key: true
  end
end
