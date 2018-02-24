class VotesController < ApplicationController
  def create
    @branch = Branch.find(params[:branch_id])
    @meeting = @branch.meetings.find(params[:meeting_id])
    @issue = @meeting.issues.find(params[:issue_id])
    @vote = @issue.votes.new(vote_params)

    redirect_to [@branch, @meeting] if @vote.save
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
end
