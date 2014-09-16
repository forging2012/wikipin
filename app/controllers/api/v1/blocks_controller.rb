class Api::V1::BlocksController < ApplicationController
  include ActionController::ImplicitRender
  include ActionController::MimeResponds

  respond_to :json

  def show
    ip = request.remote_ip
    @block = Block.where(:network_start_ip => "::ffff:#{ip.rpartition(".")[0]}.0").first
    if @block
      render :json => @block, serializer: BlockSerializerrender, root: "ip_block"
    else
      render :json => {:error => {:text => "404 Not found", :status => 404}}
    end
  end

end
