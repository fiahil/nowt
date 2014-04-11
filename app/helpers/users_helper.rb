module UsersHelper

	def truncate_name(name)
		if name.length > 70
			return name[0..70] + "..."
		else
			return name
		end
	end
end
