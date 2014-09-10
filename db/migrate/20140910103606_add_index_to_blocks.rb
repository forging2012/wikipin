class AddIndexToBlocks < ActiveRecord::Migration
  def change
    add_index :blocks, :geoname_id
  end
end
