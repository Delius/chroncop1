class CreateConditionNames < ActiveRecord::Migration
  def change
    create_table :condition_names do |t|
      t.string :name

      t.timestamps
    end
  end
end
