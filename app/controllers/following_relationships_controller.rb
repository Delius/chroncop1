class FollowingRelationshipsController < ApplicationController
def create
	@user = User.find(params[:user_id])
	current_user.followed_users << current_user
	redirect_to user
end

end