class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate

  private

  def authenticate
    if !current_student
      redirect_to github_session_path
    end
  end

  def current_student
    @current_student ||= Student.find_by_id(session[:student_id])
  end
  helper_method :current_student

end
