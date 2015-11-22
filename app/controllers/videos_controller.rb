class VideosController < ApplicationController
  before_action :find_video, only: [:show, :edit, :update, :destroy]
  
  def index
    @videos = Video.all.order('created_at DESC')
  end

  def new
  	@video = Video.new
  end

  def create
    @video = Video.new video_params
    if @video.save 
    	redirect_to @video, notice: "Video was successfully added."
    else
    	render 'new'
    end
  end

  def edit 
  end

  def update
    if @video.update video_params
    	redirect_to @video, notice: "Video was successfully updated."
    else
    	render 'edit'
    end
  end

  def show
  end

  private
  def find_video
    @video = Video.find(params[:id])
  end

  def video_params 
  	params.require(:video).permit(:title, :description, :link)
  end

end
