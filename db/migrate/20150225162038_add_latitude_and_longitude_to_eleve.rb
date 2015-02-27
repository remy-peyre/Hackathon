class AddLatitudeAndLongitudeToEleve < ActiveRecord::Migration
  def change
    add_column :eleves, :latitude, :float
    add_column :eleves, :longitude, :float
  end
end
