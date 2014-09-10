class Location < ActiveRecord::Base

  # Use a geographic implementation for the :lonlat column.
  set_rgeo_factory_for_column(:lonlat, RGeo::Geographic.spherical_factory(:srid => 4326))

  def geo_factory(lon_lat)
    self.lonlat = Location.rgeo_factory_for_column(:latlon, {}).point(lon_lat)
  end

  def self.find_near(lon, lat, radius=0.5)
    factory = RGeo::Geographic.spherical_factory
    sw = factory.point(lon+radius, lat+radius)
    ne = factory.point(lon-radius, lat-radius)
    window = RGeo::Cartesian::BoundingBox.create_from_points(sw, ne).to_geometry
    Location.where("lonlat && ?", window)
  end
end
