class SessionsController < ApplicationController
  def update
    session[:company_id] = params[:company_id]

    redirect_back(fallback_location: root_path)
  end
end
