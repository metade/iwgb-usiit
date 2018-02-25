class VotesController < ApplicationController
  before_action :setup_parent_variables

  def create
    @vote = @issue.votes.new(vote_params)

    if @vote.save
      redirect_to(
        branch_meeting_path(@branch, @meeting, anchor: "issue-#{@issue.id}"),
        notice: 'Vote cast'
      )
    else
      redirect_to(
        [@branch, @meeting], notice: @vote.errors.full_messages.to_sentence
      )
    end
  end

  def destroy
    @vote = Vote.where(issue: @issue).find(params[:id])

    redirect_to [@branch, @meeting] if @vote.destroy
  end

  private

  def vote_params
    params
      .require(:vote).permit(:status)
      .merge(session: session_id, company: current_company)
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
