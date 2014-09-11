class Api::V1::BlocksController < ApplicationController
  include ActionController::ImplicitRender
  include ActionController::MimeResponds

  respond_to :json

  def show
    ip = request.remote_ip
    @block = Block.where(:network_start_ip => "::ffff:#{ip.rpartition(".")[0]}.0").first

    render :json => {"ip" => ip, "block" => @block}
  end

end
