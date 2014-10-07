class AddOthersToSymptomNames < ActiveRecord::Migration
  def change
  	add_column :symptom_names, :other, :string
  end
end
