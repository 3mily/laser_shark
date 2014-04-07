class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  def create
    @current_student = Student.authenticate_via_github auth_hash_params
    session[:student_id] = @current_student.id
    if @current_student.completed_registration?
      redirect_to :root
    else
      redirect_to [:new, :registration]
    end
  end

  protected

  def auth_hash_params
    request.env['omniauth.auth']
  end

end
