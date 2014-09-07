require 'digest/md5'

module UsersHelper
	def gravatar user, size=48
		digest = Digest::MD5.hexdigest(@user.email)
		image_tag("http://gravatar.com/avatar/#{digest}?s=#{size}")
end

def follow_button user
	button_to 'Follow', user_follow_path(user)
end
	end