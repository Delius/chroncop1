class Tagging < ActiveRecord::Base
  belongs_to :tip
  belongs_to :tag
  
end
