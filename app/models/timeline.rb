class Timeline
	# extend ActiveModel::Naming /// 
	# not compatible must be partial_path

	def initialize user
		@user = user
	end

	def shouts
		Shout.where(user_id: shout_user_ids)
	end


	def to_partial_path
		"timelines/timeline"
	end

private

def shout_user_ids
	[@user.id] + @user.followed_user_ids
end

end
