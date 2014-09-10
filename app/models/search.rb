class Search
	def initialize options = {}
		@term = options.fetch(:term, "")
	end
end