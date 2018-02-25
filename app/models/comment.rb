class Comment < ApplicationRecord
  belongs_to :issue
  belongs_to :company
end
