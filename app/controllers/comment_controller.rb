class CommentController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = User.find(current_user.id)
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(post_id: params[:post_id], content: params[:content])
    @comment.save
    redirect_to '/post/' + @post.id.to_s + '/show'
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.content = params[:content]
    @comment.save
    redirect_to '/post/' + @post.id.to_s + '/show'
  end

  def destroy
    Comment.destroy(params[:id])
    redirect_to :back
  end
end
