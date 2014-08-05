class TipsController < InheritedResources::Base
	
	before_filter :authenticate_user!, only: [:new, :edit, :create,:update, :destroy]

	

def tip_params
  params.require(:tip).permit(:title,:difficulty_level,:condition_name_id, :symptom_name_id,:tip_type_id,:what_needed,:my_tip)
end




end
