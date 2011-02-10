require 'spec_helper'

describe "LayoutLinks" do
	
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Terms page at '/terms'" do
    get '/terms'
    response.should have_selector('title', :content => "Terms")
  end
	
	it "should have a Privacy page at '/privacy'" do
		get '/privacy'
		response.should have_selector('title', :content => "Privacy")
	end
	
	it "should have a Sign Up page at '/signup'" do
		get '/signup'
		response.should have_selector('title', :content => "Sign Up")
	end
	
	it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Terms"
    response.should have_selector('title', :content => "Terms")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "Sign Up"
    response.should have_selector('title', :content => "Sign Up")
		click_link "Privacy"
		response.should have_selector('title', :content => "Privacy")
  end
	
end
