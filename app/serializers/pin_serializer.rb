class PinSerializer < ActiveModel::Serializer
  attributes :title, :_links, :point

  def _links
    {:self => _self, :wiki => wiki_url}
  end

  def wiki_url
    href = URI::encode(object.url)
    {:href => href, :method => "GET", :rel => "wiki"}
  end

  def _self
    href = URI::encode("/api/v1/pins/#{object.id}")
    {:href => href, :method => "GET", :rel => "self"}
  end

  def point
    object.lonlat.to_json
  end

end
