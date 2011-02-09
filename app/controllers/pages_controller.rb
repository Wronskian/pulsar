class PagesController < ApplicationController

  def home
		@title = "Home"
  end

  def contact
		@title = "Contact"
  end

  def about
		@title = "About"
  end

  def terms
		@title = "Terms"
  end

  def privacy
		@title = "Privacy"
  end

end