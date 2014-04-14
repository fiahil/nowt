module UsersHelper

	def truncate_name(name)
		if name.length > 70
			return name[0..70] + "..."
		else
			return name
		end
	end

	def get_subscriptions(user)
		tags = user.tags

		return tags.map do |channel|
			"/#{channel.name}".gsub(/\s+/, "")
		end

	end
end
