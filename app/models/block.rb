class Block < ActiveRecord::Base
  # Use a geographic implementation for the :lonlat column.
  set_rgeo_factory_for_column(:lonlat, RGeo::Geographic.spherical_factory(:srid => 4326))

  def geo_factory
    self.lonlat = Block.rgeo_factory_for_column(:latlon, {}).point(self.longitude, self.latitude)
  end

  def self.find_near(lon, lat, radius=0.5)
    factory = RGeo::Geographic.spherical_factory
    sw = factory.point(lon+radius, lat+radius)
    ne = factory.point(lon-radius, lat-radius)
    window = RGeo::Cartesian::BoundingBox.create_from_points(sw, ne).to_geometry
    Block.where("lonlat && ?", window)
  end

end
