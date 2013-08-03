#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

if __FILE__==$0
  require './rubyhue/huebulb.rb'
else
  require 'rubyhue/huebulb.rb'
end

HUE_IP    = "192.168.1.28"
USERNAME  = "tatersnakes"

def jp( s )
  puts JSON.pretty_generate( s )
end

class Hue

  attr_reader :bulbs
  def initialize(ip,username)
    @ip = ip 
    @username = username
    @http = Net::HTTP.new(ip,80)
    @bulbs = []
  end

  def add_bulb(id,bulb_data)
    @bulbs << HueBulb.new(id,bulb_data)
  end

  def request_bulb_list
    hue_http_get("lights")
  end

  def request_bulb_info( id )
    hue_http_get "lights/#{id}"
  end

  def set_bulb_state( id, state )
    hue_http_put "lights/#{id}/state", state.data
  end

private
  def hue_http_get( path )
    request = Net::HTTP::Get.new("/api/#{@username}/#{path}")
    response = @http.request request
    JSON.parse response.body
  end

  def hue_http_put( path, data )
    response = @http.put("/api/#{@username}/#{path}",data.to_json)
    JSON.parse response.body
  end
end

if __FILE__==$0
  client = Hue.new(HUE_IP,USERNAME)
  bulbs_response = client.request_bulb_list

  bulbs_response.each do |id,value|
    info = client.request_bulb_info( id )
    client.add_bulb(id,info)
  end

  i = 0
  while i < 10 
    on = (i%2==0) ? true : false
    state = HueBulbState.new( {"on"=>on} )
    client.bulbs.each do |bulb|
      client.set_bulb_state( bulb.id, state )  
    end
    sleep 3
    i += 1
  end

end
