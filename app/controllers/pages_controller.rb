class PagesController < ApplicationController
  def home
  	@title = "Home"
  	#render :layout =>false   This line bypasses the default application.html.erb tempelate
  	#return @title
  end

  def contact
  	@title = "Contact"
  end
  def about
  	@title = "About Us"
  end

  def help
  	@title = "Help"
  end
end
 
