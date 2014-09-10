class Api::V1::BlocksController < ApplicationController


  def show
    ip = request.remote_ip
    render :json => {"ip"=>"#{ip}"}
  end
end
