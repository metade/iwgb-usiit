class VotesController < ApplicationController
  before_action :setup_parent_variables

  def create
    @vote = @issue.votes.new(vote_params)

    redirect_to [@branch, @meeting] if @vote.save
  end

  def destroy
    @vote = Vote.where(issue: @issue).find(params[:id])

    redirect_to [@branch, @meeting] if @vote.destroy
  end

  private

  def vote_params
    params.require(:vote).permit(:status).merge(session: session_id)
  end

  def session_id
    return session.id if session.id.present?

    session[:voted] = true
    session.id
  end

  def setup_parent_variables
    @branch = Branch.find(params[:branch_id])
    @meeting = @branch.meetings.find(params[:meeting_id])
    @issue = @meeting.issues.find(params[:issue_id])
  end
end
