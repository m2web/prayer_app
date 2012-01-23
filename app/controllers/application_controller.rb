class ApplicationController < ActionController::Base
  protect_from_forgery
	
	rescue_from ActiveRecord::RecordNotFound, :with => :rescue_not_found

  protected
  def rescue_not_found
    render :template => 'application/record_not_found', :status => :not_found
  end
end
