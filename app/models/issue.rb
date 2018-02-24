class Issue < ApplicationRecord
  belongs_to :meeting
  has_many :votes, dependent: :destroy

  def vote_count
    votes.where(status: %i[agree sympathise]).count
  end

  def vote_result
    (votes.where(status: %i[agree]).count / vote_count.to_f) * 100
  end
end
