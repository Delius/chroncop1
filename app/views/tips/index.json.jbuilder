json.array!(@tips) do |tip|
  json.extract! tip, :id, :title, :difficulty_level, :condition_name_id, :symptom_name_id, :tip_type_id, :what_needed, :my_tip
  json.url tip_url(tip, format: :json)
end
