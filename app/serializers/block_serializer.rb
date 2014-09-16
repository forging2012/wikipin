class BlockSerializer < ActiveModel::Serializer
  attributes :network_start_ip, :geoname_id, :links, :point

  def links
    {:_self => _self}
  end

  def _self
    href = URI::encode("/api/v1/blocks/#{object.id}")
    {:href => href, :method => "GET", :rel => "_self"}
  end

  def point
    :lonlat
  end

end

