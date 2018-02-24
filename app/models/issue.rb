class Issue < ApplicationRecord
  belongs_to :meeting
  has_many :votes
end
