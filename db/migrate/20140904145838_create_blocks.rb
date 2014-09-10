class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :network_start_ip
      t.integer :network_prefix_length
      t.integer :geoname_id
      t.integer :registered_country_geoname_id
      t.integer :represented_country_geoname_id
      t.string :postal_code
      t.decimal :latitude, precision: 7, scale: 4
      t.decimal :longitude, precision: 7, scale: 4
      t.boolean :is_anonymous_proxy
      t.boolean :is_satellite_provider
      t.date :created_at
      t.date :updated_at
      t.point :lonlat, :geographic => true

      t.timestamps
    end
  end
end
