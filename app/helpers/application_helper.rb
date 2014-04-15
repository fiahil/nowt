module ApplicationHelper
	def get_subscriptions(subscriptions)
		tags = subscriptions.tags

		return tags.map do |channel|
			"/#{channel.name}".gsub(/\s+/, "")
		end

	end

	def get_user_posts(user)
		posts = user.posts

		return posts.map do |channel|
			"/post/#{channel.id}"
		end
	end

	def get_tags(post)
		return post.tags.map { |tag| "#{tag.name}"}.join(", ")
	end
end
