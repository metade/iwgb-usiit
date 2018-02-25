class Company < ApplicationRecord
  def self.for_select
    order(:name).pluck(:name, :id)
  end
end
