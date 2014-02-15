class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    @user.name = params.require(:user).require(:name)
    @user.save
  end

  def update
    super
    @user.name = params.require(:user).require(:name)
    @user.save
  end
end