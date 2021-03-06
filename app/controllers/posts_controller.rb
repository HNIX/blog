class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
    else
      @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 5)
    end
  end

  def new 
    @post = Post.new
  end

  def create
  	@post = Post.new post_params
  	if @post.save
  		redirect_to @post, notice: "Post successfully created"
  	else
  		render 'new', notice: "Post failed to save"
  	end
  end

  def show
    @posts = Post.all.limit(3).order('created_at DESC')
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Post successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :slug, :link)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
