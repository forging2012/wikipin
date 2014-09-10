class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.decimal :latitude, precision: 17, scale: 14
      t.decimal :longitude, precision: 17, scale: 14
      t.string :title
      t.string :url
      t.date :created_at
      t.date :updated_at
      t.point :lonlat, :geographic => true

      t.timestamps
    end
  end
end
