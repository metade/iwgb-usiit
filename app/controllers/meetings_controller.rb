class MeetingsController < ApplicationController
  def show
    @branch = Branch.find(params[:branch_id])
    @meeting = @branch.meetings.find(params[:id])
    @new_issue = Issue.new
  end
end
