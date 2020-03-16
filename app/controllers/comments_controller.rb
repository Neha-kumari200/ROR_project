class CommentsController < ApplicationController
  before_action :authenticate_account!#, except:[:show, :index]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.account_id = current_account.id if current_account
    @comment.save

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end   
  end  
  def show
  end
    
  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end  

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end    
  end
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post) 
  end 

  private

  def comment_params
    params.require(:comment).permit(:post_id,:description, :image)
  end    
end
