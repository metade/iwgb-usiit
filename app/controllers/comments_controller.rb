class CommentsController < ApplicationController
  before_action :setup_parent_variables

  def create
    @comment = @issue.comments.new(comment_params)

    redirect_to [@branch, @meeting] if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def setup_parent_variables
    @branch = Branch.find(params[:branch_id])
    @meeting = @branch.meetings.find(params[:meeting_id])
    @issue = @meeting.issues.find(params[:issue_id])
  end
end
