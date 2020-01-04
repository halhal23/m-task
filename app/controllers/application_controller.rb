class ApplicationController < ActionController::Base
  private def current_user
    current_user = User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  class LoginRequired < StandardError; end
  class CurrentUserRequired < StandardError; end
  class Forbidden < StandardError; end

  private def login_required
    raise LoginRequired unless current_user
  end

  private def current_user_required
    raise CurrentUserRequired unless current_user
    raise CurrentUserRequired unless current_user.id == params[:id].to_i
  end
end
