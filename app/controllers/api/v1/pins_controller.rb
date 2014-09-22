class Api::V1::PinsController < ApplicationController
  include EntryFiltering

  respond_to :json

  def index
    if @pins
      render :json => @pins, each_serializer: PinSerializer, root: "pins"
    else
      @error = Error.new(:text => "404 Not found", :status => 404, :url => request.url, :method => request.method)
      render :json => @error.serializer
    end
  end

  def show
    @pin = Pin.find(params[:id])
    if @pin
      render :json => @pin, serializer: PinSerializer, root: "pin"
    else
      @error = Error.new(:text => "404 Not found", :status => 404, :url => request.url, :method => request.method)
      render :json => @error.serializer
    end
  end

end
