class ErrorSerializer < ActiveModel::Serializer
  attributes :status, :text, :_links

  def _links
    {:url => url,  }
  end

  def url
    href = URI::encode(object.url)
    {:href => href, :method => object.method, :rel => "request"}
  end

  def entry
    href = URI::encode("/api/v1")
    {:href => href, :method => "GET", :rel => "entry point", :params => params}
  end

  def params
    {:params => {:point => {:value => "{lon},{lat}", :optional => true}, :title => {:value => "text", :optional => true}}}
  end

end
