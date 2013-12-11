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

  def request_schedule_list
    hue_get "schedules"
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
  if ARGV.length < 2
    STDERR.puts "Invaid args."
    STDERR.puts "Usage: #{__FILE__} ip username"
    exit
  end

  client = Hue.new(ARGV[0],ARGV[1])

  bulbs_response = client.request_bulb_list
  bulbs_response.each do |id,value|
    info = client.request_bulb_info( id )
    jp info
    client.add_bulb(id,info)
  end

  jp client.request_group_list
  jp client.request_schedule_list

end





