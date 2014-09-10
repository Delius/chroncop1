class Search 


	attr_reader :term
	def initialize options = {}
		@term = options.fetch(:term, "")
	end

	def shouts
		Shout.search do 
			fulltext @term
		end

	end

	def to_partial_path
		"searches/search"

	end
	# def to_partial_path
	# 	"shouts/shout"
	# end

	# private
	
	# def text_shouts
	# 	TextShout.where("body LIKE ?", search_term)
	# 		end
	# def search_term
	# 	"%#{term}%"
	# end
end