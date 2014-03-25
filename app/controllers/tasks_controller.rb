class TasksController < ApplicationController
	
	def live_search
<<<<<<< HEAD
	  @tasks = Tag.where("label ilike ? or description ilike ?", "%#{params[:q]}%", "%#{params[:q]}%").limit(15)
=======
	  

	  input = params[:q]

	  #get input, check for empty 
	  if(input != "")
	  	@tasks = Tag.where("name ilike ? or description ilike ?", "%#{params[:q]}%", "%#{params[:q]}%").limit(15)
	  else
	  	@tasks = Tag.where("name like 'NOTHING'")
	  end

>>>>>>> 316bea4d166cdd5e8486b176d718b1ce3e287ef5
	  render :layout => false
	end

	#if empty
	def empty_search
		render :layout => false
	end

end
