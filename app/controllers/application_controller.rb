class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
