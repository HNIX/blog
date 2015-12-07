class WelcomeController < ApplicationController
  def index
  	@user = User.find(1)
  	@posts = Post.all.limit(3).order("created_at desc")
  	@projects = Project.all.limit(3).order("created_at desc")
  	@videos = Video.all.limit(3).order("created_at desc")
  	@combined_sorted = (@videos + @projects + @posts).sort{|a,b| a.created_at <=> b.created_at }
  end

end
