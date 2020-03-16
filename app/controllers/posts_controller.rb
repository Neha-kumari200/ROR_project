class PostsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end  

  def new
    @post = current_account.posts.new	
    #@post = Post.new
  end
  
  def create
  	@post = current_account.posts.new(post_params)
    #@post = Post.new(post_params)
    if @post.save
      flash[:notice] = "post was created successfully!"
      redirect_to @post
    else
      flash[:notice] = "post was not saved!"
      redirect_to new_post_path
    end  
  end

  def show

  end

  def edit
  
  end 

  def update
    if @post.update(post_params)
      flash[:notice] = "post was Updated successfully!"
      redirect_to @post 
    else
      render 'edit' 
    end   
  end

  def destroy
    @post.destroy
    flash[:notice] = "post '#{@post.title}' deleted successfully!"
    redirect_to posts_path
  end  

  private

  def set_post
      @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end	