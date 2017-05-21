class PostController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.page params[:page]
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
  end

  def create
    @user = User.find(current_user.id)
    uploader = ImgUploader.new
    uploader.store!(params[:img])
    @post = @user.posts.new(title: params[:title], content: params[:content], url: uploader.url)
    @post.save
    redirect_to '/post/index'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect_to '/post/' + @post.id.to_s + '/show'
  end

  def destroy
    @post = Post.find(params[:id])
    # @post.comments.destroy_all
    @post.destroy
    redirect_to '/post/index'
  end
end