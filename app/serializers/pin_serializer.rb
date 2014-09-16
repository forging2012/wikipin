class PinSerializer < ActiveModel::Serializer
  attributes :title, :links, :point

  def links
    {:_self => _self, :_url => object.url}
  end

  def _self
    href = URI::encode("/api/v1/pins/#{object.id}")
    {:href => href, :method => "GET", :rel => "_self"}
  end

  def point
    object.lonlat.to_json
  end

end
