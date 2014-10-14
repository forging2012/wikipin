module GeoFactory
  extend ActiveSupport::Concern

  def geo_factory
    self.lonlat = self.class.rgeo_factory(self.longitude, self.latitude)
  end

  def reverse_geo
    self.longitude = self.lonlat.longitude
    self.latitude = self.lonlat.latitude
  end

  module ClassMethods

    def rgeo_factory(longitude, latitude)
      self.rgeo_factory_for_column(:latlon).point(longitude, latitude)
    end

    def find_near(lon, lat, radius=0.5)
      factory = RGeo::Geographic.spherical_factory
      sw = factory.point(lon+radius, lat+radius)
      ne = factory.point(lon-radius, lat-radius)
      window = RGeo::Cartesian::BoundingBox.create_from_points(sw, ne).to_geometry
      self.where("lonlat && ?", window)
    end
  end
end