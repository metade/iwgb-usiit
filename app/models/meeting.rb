class Meeting < ApplicationRecord
  belongs_to :branch
  has_many :issues
end
