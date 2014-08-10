class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :sidebar_values
before_filter do
  resource = controller_name.singularize.to_sym
  method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
end





def sidebar_values
    @condition_names = ConditionName.all
    @symptom_names = SymptomName.all
    @tip_types = TipType.all
  end


end
