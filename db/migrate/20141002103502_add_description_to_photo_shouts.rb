class AddDescriptionToPhotoShouts < ActiveRecord::Migration
  def change
    add_column :photo_shouts, :description, :string
  end
end
