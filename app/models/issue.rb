class Issue < ApplicationRecord
  belongs_to :company
  belongs_to :meeting
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy

  delegate :branch, to: :meeting

  scope :order_by_votes, lambda {
    select('issues.*, COUNT(votes.id) AS votes_total')
      .joins("left join votes on votes.issue_id = issues.id")
      .group('issues.id')
      .order('votes_total DESC')
  }
  scope :order_by_comments, lambda {
    select('issues.*, COUNT(comments.id) AS comments_total')
      .joins("left join comments on comments.issue_id = issues.id")
      .group('issues.id')
      .order('comments_total DESC')
  }

  def vote_count
    votes.where(status: %i[agree disagree sympathise]).count
  end

  def vote_chart
    @vote_chart ||= begin
      { 'agree' => 0, 'sympathise' => 0, 'disagree' => 0 }
        .merge(votes.group(:status).count)
    end
  end

  def vote_result(status)
    (votes.where(status: status).count / vote_count.to_f) * 100
  end

  def vote_companies
    votes.joins(:company).group("companies.name").count("votes.id")
  end
end
