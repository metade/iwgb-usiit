class IssuesController < ApplicationController
  def create
    @branch = Branch.find(params[:branch_id])
    @meeting = @branch.meetings.find(params[:meeting_id])
    @issue = @meeting.issues.new(issue_params)

    redirect_to [@branch, @meeting] if @issue.save
  end

  private

  def issue_params
    params.require(:issue).permit(:name).merge(company: current_company)
  end
end
