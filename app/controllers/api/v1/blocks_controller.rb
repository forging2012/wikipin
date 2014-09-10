class Api::V1::BlocksController < ApplicationController

  respond_to :json

  def show
    ip = request.remote_ip
    render :json => {"ip":"#{ip}"}
  end
end
