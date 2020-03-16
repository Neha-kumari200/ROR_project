class FriendshipsController < ApplicationController

  def index

  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = ‘Added friend.’
      redirect_to current_account
    else
      flash[:notice] = ‘Unable to add friend.’
      redirect_to accounts_path
    end
  end
  def delete
  	@friendship = current_account.friendships.find(params[:id])
  end

  def destroy
  @friendship = current_account.friendships.find(params[:id])
  @friendship.destroy
  flash[:notice] = "Removed friendship."
  redirect_to current_account
  end

end
