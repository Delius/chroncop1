require 'digest/md5'

module UsersHelper
	def gravatar user, size=48
		digest = Digest::MD5.hexdigest(@user.email)
		image_tag("http://gravatar.com/avatar/#{digest}?s=#{size}")
	end

	def follow_button user
		if current_user.following? user 
			button_to 'Unfollow', user_follow_path(user), method: :delete
		else
			button_to 'Follow', user_follow_path(user)
		end
	end
end