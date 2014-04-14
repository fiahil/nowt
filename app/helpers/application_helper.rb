module ApplicationHelper
	def get_subscriptions(subscriptions)
		tags = subscriptions.tags

		return tags.map do |channel|
			"/#{channel.name}".gsub(/\s+/, "")
		end

	end
end
