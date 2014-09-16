class BlockSerializer < ActiveModel::Serializer
  attributes :network_start_ip, :geoname_id, :point

  def links
    {:_self => _self, :_graph => _graph}
  end

  def _self
    href = URI::encode("/api/v1/blocks/#{self.id}")
    {:href => href, :method => "GET", :rel => "_self"}
  end

  def point
    self.lonlat
  end

end

