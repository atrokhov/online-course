class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit block unblock update destroy ]
  
  def index
  	check_superuser_rights do
      @users = User.all.order :id
	  end
  end

  def show
  end

  def edit
  end

  def block
    @user.blocked = true
    @user.save
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully blocked." }
    end
  end

  def unblock
    @user.blocked = false
    @user.save
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully unblocked." }
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
    end
  end

  private

    def set_user
      check_superuser_rights do
        @user = User.find(params[:id])
      end
    end

  	def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :subscription, :blocked, :role)
    end

    def check_superuser_rights
      if user_signed_in? and current_user.superuser?
        yield
      else
        redirect_to categories_url, status: :found, alert: "You don't have enough rights"
      end
    end
end
