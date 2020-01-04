class AccountsController < ApplicationController
  before_action :login_required

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.assign_attributes(account_params)
    if @user.save
      flash[:notice] = "正常に更新されました。"
      redirect_to :account
    else
      render :edit_account
    end
  end

  def account_params
    params.require(:account).permit(:name, :email)
  end
end
