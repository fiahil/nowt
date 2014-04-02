class ActivitiesController < ApplicationController
  def index
  	@activities = PublicActivity::Activity.order("created_at desc").where(trackable_id: find_interests, owner_type: "User").where(['owner_id <> ?', current_user]).page(params[:page]).per(3)

  end
end
