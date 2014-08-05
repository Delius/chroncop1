class Tip < ActiveRecord::Base
DIFFICULTY=%w(Easy Medium Hard)
	belongs_to :condition_name
	belongs_to :symptom_name
	belongs_to :tip_type

	validates_presence_of :title, :condition_name_id, :symptom_name_id, :tip_type_id
end