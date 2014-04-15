module Commontator
  module ApplicationHelper
    def javascript_proc
      Commontator.javascript_proc.call(self).html_safe
    end

    def get_tags(post)
		return post.tags.map { |tag| "#{tag.name}"}.join(", ")
	end
  end
end
