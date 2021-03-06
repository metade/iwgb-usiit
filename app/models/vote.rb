class Vote < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :issue

  enum status: { abstain: 0, sympathise: 1, agree: 2, disagree: 3 }
end
