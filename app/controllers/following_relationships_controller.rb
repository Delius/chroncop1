class FollowingRelationshipsController < ApplicationController


# follow user
def create
	current_user.follow user
	redirect_to user, notice: 'Now Following user'
end
# unfollow user
def destroy
	current_user.unfollow user
	redirect_to user, notice: 'No longer following user'
end

  # extract method pattern
 private 

  def user
  	@_user ||= User.find(params[:user_id])
  end

end