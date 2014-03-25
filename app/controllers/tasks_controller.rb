class TasksController < ApplicationController
	
	def live_search
	  

	  input = params[:q]

	  #get input, check for empty 
	  if(input != "")
	  	@tasks = Tag.where("name ilike ? or description ilike ?", "%#{params[:q]}%", "%#{params[:q]}%").limit(15)
	  else
	  	@tasks = Tag.where("name like 'NOTHING'")
	  end

	  render :layout => false

	end

end
