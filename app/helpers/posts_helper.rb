module PostsHelper


	def comment_count(post)
		count = post.thread.comments.count

		return count == 1 ? "#{count} Comment" : "#{count} Comments"
	end

	def get_tags(post)
		return post.tags.map { |tag| "#{tag.name}"}.join(", ")
	end


end
