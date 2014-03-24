class TagsController < ApplicationController

	def index
		@tags = Tag.where("name like ?", "%#{params[:q]}%").limit(5)
		respond_to do |format|
			format.html
			format.json {render :json => @tags}
		end
	end
end