class TasksController < ApplicationController
	
	def live_search
	  

	  input = params[:q]

	  #get input, check for empty 
	  if(input != "")
	  	@tasks = Tag.where("label ilike ?", "%#{params[:q]}%").limit(15)
	  else
	  	@tasks = Tag.where("label like 'NOTHING'")
	  end

	  render :layout => false

	end

end
