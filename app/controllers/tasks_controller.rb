class TasksController < ApplicationController
	
	def live_search
	  @tasks = Tag.where("label ilike ? or description ilike ?", "%#{params[:q]}%", "%#{params[:q]}%").limit(15)
	  render :layout => false
	end

	#if empty
	def empty_search
		render :layout => false
	end

end
