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
    click_link "Sign Up"
    response.should have_selector('title', :content => "Sign Up")
		click_link "Privacy"
		response.should have_selector('title', :content => "Privacy")
  end
	
	describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Sign In")
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Sign Out")
    end

    it "should have a profile link" do
			visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profile")
		end
  end	
end
