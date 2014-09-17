class Api::V1::PinsController < ApplicationController
  include EntryFiltering

  respond_to :json

  def index
    if @pins
      render :json => @pins, each_serializer: PinSerializer, root: "pins"
    else
      render :json => {:error => {:text => "404 Not found", :status => 404, :url => request.url, :method => request.method}},
             serializer: ErrorSerializer
    end
  end

end
