class FollowingRelationshipsController < ApplicationController


# follow user
def create
	user = User.find(params[:user_id])
	current_user.followed_users << current_user
	redirect_to user
end
# unfollow user
def destroy
	user = User.find(params[:user_id])
	current_user.followed_users.delete(user)
	redirect_to user

end