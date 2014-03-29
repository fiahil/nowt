class ActivitiesController < ApplicationController
  def index
  	@activities = PublicActivity::Activity.order("created_at desc").where(trackable_id: find_interests, owner_type: "User").where(['owner_id <> ?', current_user])
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
