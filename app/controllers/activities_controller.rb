class ActivitiesController < ApplicationController
  def index
  	@activities = find_comment_activities

  end

  private

  	def find_comment_activities 
  		my_posts = Post.where(user_id: current_user).ids
  		activities = PublicActivity::Activity.where(key: "post.comment").where(trackable_id: my_posts).where(['owner_id <> ?', current_user]).ids
  		activities += PublicActivity::Activity.where(trackable_id: find_interests, owner_type: "User").where(['owner_id <> ?', current_user]).ids
		
		return PublicActivity::Activity.where(id: activities.uniq).page(params[:page]).per(10)
	end

end
