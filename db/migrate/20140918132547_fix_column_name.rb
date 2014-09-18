class FixColumnName < ActiveRecord::Migration
  def change
    change_table :pins do |t|
      t.rename :latitude, :old_latitude
      t.rename :longitude, :latitude
      t.rename :old_latitude, :longitude
    end
  end
end
