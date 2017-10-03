class PostsController < ApplicationController

  before_action :ensure_login!

  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to post_url(@post)
    else
      @subs = Sub.all
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  # def destroy
  #   @post = current_user.posts.find(params[:id])
  #   @post.destroy!
  #   redirect_to sub_url(post.sub)
  # end

  def edit
    @post = current_user.posts.find(params[:id])
    @subs = Sub.all
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      @subs = Sub.all
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

end
