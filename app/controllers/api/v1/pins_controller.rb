class Api::V1::PinsController < ApplicationController
  include ActionController::ImplicitRender
  include ActionController::MimeResponds

  respond_to :json

  def index
    ip = request.remote_ip
    if params[:point]
      point = params[:point].split(',')
      @pins = Pin.find_near(point[0], point[1])
      render :json => @pins, each_serializer: PinSerializer
    elsif @block = Block.where(:network_start_ip => "::ffff:#{ip.rpartition(".")[0]}.0").first
      @pins = Pin.find_near(@block.lon, @block.lat)
      render :json => @pins, each_serializer: PinSerializer
    else
      render :json => {:error => {:text => "404 Not found", :status => 404}}
    end
  end

end
