class CreateSymptomNames < ActiveRecord::Migration
  def change
    create_table :symptom_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
