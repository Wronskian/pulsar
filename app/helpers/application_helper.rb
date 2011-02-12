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
	
	def left_sidebar
		case
			when @title == "Sign Up"
				render "users/new-left-sidebar"
			when @title == "Home"
				render "pages/home-left-sidebar"
		end
	end

end
