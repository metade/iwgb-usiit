class Meeting < ApplicationRecord
  belongs_to :branch
  has_many :issues

  def live?
    time.future?
  end

  def over?
    !live?
  end
end
