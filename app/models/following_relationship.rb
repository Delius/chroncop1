class FollowingRelationship < ActiveRecord::Base
  belongs_to :follower
  belongs_to :followed_user
end
