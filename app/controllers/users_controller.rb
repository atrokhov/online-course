class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy ]
  
  def index
  	check_superuser_rights do
      @users = User.all
	  end
  end

  def show
  	check_superuser_rights do
      @user = User.find(params[:id])
	  end
  end

  def new
    check_superuser_rights do
      @user = User.new
    end
  end

  def edit
  end

  def create
    check_superuser_rights do
      @user = User.new(users_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, notice: "User was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(users_params)
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
      params.require(:user).permit(:first_name, :last_name, :email)
    end

    def check_superuser_rights
      if user_signed_in? and current_user.is_superuser?
        yield
      else
        redirect_to categories_url, status: :found, alert: "You don't have enough rights"
      end
    end
end
