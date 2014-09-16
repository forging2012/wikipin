class Api::V1::PinsController < ApplicationController
  include ActionController::ImplicitRender
  include ActionController::MimeResponds

  respond_to :json

  def index
    if params[:point]
      point = params[:point].split(',')
      @pins = Pin.find_near(point[0].to_f, point[1].to_f)
      if @pins
        render :json => @pins, each_serializer: PinSerializer, root: "pins"
      else
        render :json => {:error => {:text => "404 Not found", :status => 404}}
      end
    else
      ip = request.remote_ip
      @block = Block.where(:network_start_ip => "::ffff:#{ip.rpartition(".")[0]}.0").first
      if @block
        @pins = Pin.find_near(@block.lon.to_f, @block.lat.to_f)
        if @pins
          render :json => @pins, each_serializer: PinSerializer, root: "pins"
        else
          render :json => {:error => {:text => "404 Not found", :status => 404}}
        end
      else
        render :json => {:error => {:text => "404 Not found", :status => 404}}
      end
    end
  end

end
