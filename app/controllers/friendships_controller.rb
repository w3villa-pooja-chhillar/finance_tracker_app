class FriendshipsController < ApplicationController
    def create
       friend = User.find(params[:friend])
       current_user.friendships.build(friend_id:friend.id)
       if current_user.save
        flash[:notice]= "Following"
       else
        flash[:alert]= "something  went wrong"
       end
    end
    
  
    def destroy
        friendship = current_user.friendships.where(friend_id: params[:id]).first
        friendship.destroy
        flash[:alert] = "Stopped following"
        redirect_to my_friends_path
      end
end
