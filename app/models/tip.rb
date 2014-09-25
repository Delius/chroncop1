# require 'open-uri'
class Tip < ActiveRecord::Base
	DIFFICULTY=%w(Easy Medium Hard)
	belongs_to :condition_name
	belongs_to :symptom_name
	belongs_to :tip_type
	
	acts_as_taggable_on :tags
	validates_presence_of :title, :condition_name_id, :symptom_name_id
	belongs_to :user
	validates :user_id, presence: true
	
	has_reputation :votes, source: :user, aggregated_by: :sum
	

# authority system 

attr_reader :term
	def initialize options = {}
		@term = options.fetch(:term, "")
	end

def self.text_search(query)
	if query.present?
		where("name ilike :q or content ilike :q", q: "%#{query}%")
	else
		scoped

end
# def search_term
# 		"%#{term}%"
# 	end
end
end