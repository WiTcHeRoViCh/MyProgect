class FriendsController < ApplicationController

  def index
    @friends = current_user.friends.select {|friend|

      friend.friendships.where(acceted: true, friend_id: current_user.id)

    }
  end	

end	