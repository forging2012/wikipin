class Block < ActiveRecord::Base

  include GeoFactory

  # Use a geographic implementation for the :lonlat column.
  set_rgeo_factory_for_column(:lonlat, RGeo::Geographic.spherical_factory(:srid => 4326))

end
