module ApplicationHelper
  def current_company
    @current_company ||= Company.find_by(id: session[:company_id])
  end
end
