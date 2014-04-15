module PostsHelper
	def comment_count(post)
		count = post.thread.comments.count

		return count == 1 ? "#{count} Comment" : "#{count} Comments"
	end
end
