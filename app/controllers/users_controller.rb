class UsersController < ApplicationController
  before_action :pre_edit, only: [:edit, :edit_name, :edit_password, :edit_email]
  before_action :authenticate
  layout :resolve_template
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  def edit
    
  end

  def edit_name

  end

  def edit_password

  end

  def edit_email

  end

  def update_tags
    @user = User.find(current_user.id)
    unless @user.update_attributes(user_params)
      flash[:error] = "Smart tags were not saved properly. Try again!"
    end
    redirect_to(root_path)
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      flash[:success] = "You have successfully updated your account!"
      redirect_to(controller: "users", action: "profile")
    else
      flash[:error] = "Your account did not update successfully. Please try again!"
      render "edit"
    end
  end

  def destroy
    @user = current_user

    if @user.destroy
      flash[:success] = "You have successfully deleted your account!"
      redirect_to(root_path)
    else
      flash[:error] = "Could not delete your account. Please try again!"
      render "edit"
    end
  end


  
  def profile
      @user = current_user
      @your_nowts = Post.where(user_id: current_user).limit(16)
      tags = @user.tags
      @interests = find_interests
      @trending = Post.all.limit(16)
  end

  private

    def authenticate
      unless user_signed_in?
        redirect_to(root_path)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email,:password, :password_confirmation, :current_password, :tag_tokens)
    end

    def pre_edit
      @user = current_user
    end
    
    def resolve_template
      case action_name
      when "edit", "edit_password", "edit_name", "edit_email"

      else
        "application"
      end
    end

    def find_interests
      post_ids = []
      current_user.tags.each do |tag|
        query = PostTag.where(tag_id: tag)

        unless query.blank?
          post_ids = post_ids + query.map {|x| x.post_id}
        end
      end

      return Post.find_all_by_id(post_ids)

    end

end
