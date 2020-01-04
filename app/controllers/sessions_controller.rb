class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "ログインしました。"
      redirect_to :root
    else
      flash[:alert] = "ログインに失敗しました。"
      redirect_to "/login"
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました。"
    redirect_to :root
  end
end
