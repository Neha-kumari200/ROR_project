class PostsController < ApplicationController
   before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end  

  def new
    @post = current_account.posts.build	
  end

  def create
  	@post = current_account.posts.build(post_params)

    if @post.save
      redirect_to @post, flash: { success: "post was created successfully!"}
    else
      redirect_to new_post_path, flash: { danger: "post was not saved!"}
    end  
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    #@post = Post.find(params[:id])
  end 

  def update
    #@post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit' 
    end   
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end  

  private

  def set_post
      @post = Post.find(params[:id])
  end

  
  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

end	