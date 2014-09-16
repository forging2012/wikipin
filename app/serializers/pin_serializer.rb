class PinSerializer < ActiveModel::Serializer
  attributes :title, :links, :point

  def links
    {:_self => _self, :_wiki => wiki_url}
  end

  def wiki_url
    href = URI::encode(object.url)
    {:href => href, :method => "GET", :rel => "_wiki"}
  end

  def _self
    href = URI::encode("/api/v1/pins/#{object.id}")
    {:href => href, :method => "GET", :rel => "_self"}
  end

  def point
    object.lonlat.to_json
  end

end
