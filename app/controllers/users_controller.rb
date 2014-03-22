class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end
  
  def profile
    unless user_signed_in?
      redirect_to(root_path)
    else
      
      @user = current_user
      @your_nowts = Post.where(user_id: current_user).limit(16)
      @interests = Post.all.limit(16)
      @trending = Post.all.limit(16)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end

end
