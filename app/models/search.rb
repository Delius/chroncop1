class Search
	include ActiveModel::Model # for rails 4
	# extend ActiveModel::Naming //for rails 3. - -
	attr_reader :term
	def initialize options = {}
		@term = options.fetch(:term, "")
	end

	def shouts
		Shout.photo_shouts.where(content_id: photo_shouts)
	end



	# def to_partial_path
	# 	"searches/search"
	# end
	# def to_partial_path
	# 	"shouts/shout"
	# end

	private
	
	def photo_shouts
		PhotoShout.where("description LIKE ?", search_term)
	end
	def search_term
		"%#{term}%"
	end
end