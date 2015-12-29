class WelcomeController < ApplicationController
  def index
  	@user = User.find(1)
  	@posts = Post.all.limit(3).order("created_at desc")
  end
end
