class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :title
      t.string :difficulty_level
      t.integer :condition_name_id
      t.integer :symptom_name_id
      t.integer :tip_type_id
      t.text :what_needed
      t.text :my_tip

      t.timestamps
    end
  end
end
