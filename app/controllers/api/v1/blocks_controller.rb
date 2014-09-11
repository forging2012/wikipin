class Api::V1::BlocksController < ApplicationController
  include ActionController::ImplicitRender
  include ActionController::MimeResponds

  respond_to :json

  def show
    ip = request.remote_ip
    @block = Block.where(:network_start_ip => "::ffff:#{ip}").first

    render :json => @block
  end

end
