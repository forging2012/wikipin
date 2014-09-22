class Api::V1::BlocksController < ApplicationController
  include FindBlock

  respond_to :json

  def show
    @block = Block.find(params[:id])
    if @block
      render :json => @block, serializer: BlockSerializer, root: "ip_block"
    else
      @error = Error.new(:text => "404 Not found", :status => 404, :url => request.url, :method => request.method)
      render :json => @error.serializer
    end
  end

  def get_block
    if @block
      render :json => @block, serializer: BlockSerializer, root: "ip_block"
    else
      @error = Error.new(:text => "404 Not found", :status => 404, :url => request.url, :method => request.method)
      render :json => @error.serializer
    end
  end

end
