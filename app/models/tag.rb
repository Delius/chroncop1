class Tag < ActiveRecord::Base

has_many :taggings
has_many :tips, through: :taggings
end