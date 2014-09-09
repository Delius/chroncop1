class Timeline
	# extend ActiveModel::Naming

	def initialize user
		@user = user
	end

	def shouts
		@user.shouts
	end


	def to_partial_path
		"timelines/timeline"
	end

end
