class HomeController < ApplicationController

  def index
    unless user_signed_in?
		render 'root'
	else 
		redirect_to(controller: "users", action: "profile")
	end
  end
end
