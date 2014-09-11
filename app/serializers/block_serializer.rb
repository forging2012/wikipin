class BlockSerializer < ActiveModel::Serializer
  attributes :network_start_ip, :geoname_id, :lonlat
end

