class IssuesController < ApplicationController
  def create
    @branch = Branch.find(params[:branch_id])
    @meeting = @branch.meetings.find(params[:meeting_id])
    @issue = @meeting.issues.new(issue_params)

    if @issue.save
      redirect_to(
        branch_meeting_path(@branch, @meeting, anchor: "issue-#{@issue.id}")
      )
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:name).merge(company: current_company)
  end
end
