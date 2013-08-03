#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

if __FILE__==$0
  require './rubyhue/huebulb.rb'
  require './rubyhue/huegroup.rb'
else
  require 'rubyhue/huebulb.rb'
  require 'rubyhue/huegroup.rb'
end

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
    @groups = []
  end

  def register_username
    data = { "devicetype"=>"rubyhue",
              "username"=>@username }
    response = @http.post "/api", data.to_json
    JSON.parse response.body
  end

  def request_config
    hue_get "config"
  end

  def add_bulb(id,bulb_data)
    @bulbs << HueBulb.new( id, bulb_data )
  end

  def request_bulb_list
    hue_get "lights"
  end

  def request_bulb_info( id )
    hue_get "lights/#{id}"
  end

  def request_group_list
    hue_get "groups"
  end

  def set_bulb_state( id, state )
    hue_put "lights/#{id}/state", state.data
  end

private
  def hue_get( path )
    request = Net::HTTP::Get.new( "/api/#{@username}/#{path}" )
    response = @http.request request
    JSON.parse response.body
  end

  def hue_put( path, data )
    response = @http.put( "/api/#{@username}/#{path}", data.to_json )
    JSON.parse response.body
  end

end

if __FILE__==$0
  HUE_IP    = ARGV[0] || "192.168.1.28"
  USERNAME  = ARGV[1] || "tatersnakes"

  client = Hue.new(HUE_IP,USERNAME)

  bulbs_response = client.request_bulb_list
  bulbs_response.each do |id,value|
    info = client.request_bulb_info( id )
    client.add_bulb(id,info)
    puts client.bulbs.last.name
  end
end
