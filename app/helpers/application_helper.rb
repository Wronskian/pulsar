module ApplicationHelper

	def title
		base_title = "Pulsar"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
	
	def logo
		image_tag("logo.png", :alt => "Pulsar Logo")
	end

end
