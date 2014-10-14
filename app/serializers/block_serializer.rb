class BlockSerializer < ActiveModel::Serializer
  attributes :network_start_ip, :geoname_id, :_links, :point, :latitude, :longitude

  def _links
    {:self => _self}
  end

  def _self
    href = URI::encode("/api/v1/blocks/#{object.id}")
    {:href => href, :method => "GET", :rel => "self"}
  end

  def point
    object.lonlat
  end

end

