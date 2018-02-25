class Issue < ApplicationRecord
  belongs_to :company
  belongs_to :meeting
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  delegate :branch, to: :meeting

  def vote_count
    votes.where(status: %i[agree disagree sympathise]).count
  end

  def vote_chart
    votes.group(:status).count
  end

  def vote_result(status)
    (votes.where(status: status).count / vote_count.to_f) * 100
  end

  def vote_companies
    votes.joins(:company).group("companies.name").count("votes.id")
  end
end
