module EntryFiltering
  extend ActiveSupport::Concern

  include do
    before_filter :entry_action
  end


  def pins_by_point(point)
    point = point.split(',')
    @pins = Pin.find_near(point[0].to_f, point[1].to_f)
  end

  def pins_by_ip(ip)
    block = Block.where(:network_start_ip => "::ffff:#{ip.rpartition(".")[0]}.0").first
    if block
      Pin.find_near(block.lon.to_f, block.lat.to_f)
    end
  end

  def entry_action

    if params[:point]
      @pins = pins_by_point(params[:point])
    else
      @pins = pins_by_ip(request.remote_ip)
    end

  end

end