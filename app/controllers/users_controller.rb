class UsersController < ApplicationController
  before_filter :set_user, only: [:show, :edit, :update]
  before_filter :validate_authorization_for_user, only: [:edit, :update]
  # before_action :signed_in_user, only: [:edit, :update]

  def index
  @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

   
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end


  # PATCH/PUT /users/1
  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

     def validate_authorization_for_user
    #    redirect_to root_path unless @user == current_user
     end



def user_params
  params.require(:user).permit(:id,:name,:about, :avatar,:email, :password,:password_confirmation)
end
# Before filters

    

  end
