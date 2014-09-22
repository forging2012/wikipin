module FindBlock
  extend ActiveSupport::Concern

  included do
    before_filter :find_block
  end

  def set_ip
    if params[:ip_address]
      params[:ip_address]
    else
      request.remote_ip
    end
  end


  def find_block
    ip = set_ip
    @block = Block.where(:network_start_ip => "::ffff:#{ip.rpartition(".")[0]}.0").first
  end

end