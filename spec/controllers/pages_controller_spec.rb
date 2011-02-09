require 'spec_helper'

describe PagesController do

	render_views #makes sure views are actually rendered
	
	describe "GET Pages and Check Titles" do
	
		base_title = "Pulsar"
		pages = [ "Home", "Contact", "About", "Terms", "Privacy" ]
	
		pages.each do |page|
		
			it "should be successful" do 
				get page.downcase #downcase is necessary to GET proper controller action
				response.should be_success 
			end
			
			it "should have the right title" do 
				get page.downcase #downcase is necessary to GET proper controller action
				response.should have_selector("title", 
				                              :content => "#{base_title} | #{page}") 
			end
			
		end	

	end
end