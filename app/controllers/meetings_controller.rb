class MeetingsController < ApplicationController
  def show
    @branch = Branch.find(params[:branch_id])
    @meeting = @branch.meetings.find(params[:id])
    @new_issue = Issue.new

    @issues = load_issues
  end

  private

  def load_issues
    case params[:order]
    when 'votes' then @meeting.issues.order_by_votes
    when 'comments' then @meeting.issues.order_by_comments
    else @meeting.issues.order('created_at asc')
    end
  end
end
