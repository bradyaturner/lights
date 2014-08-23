#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

require 'rubyhue/huebulb.rb'
require 'rubyhue/huegroup.rb'
require 'rubyhue/huebridge.rb'
require 'rubyhue/hueexception.rb'
require 'rubyhue/huesensor.rb'

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
    @bridges = []
  end

  def discover_hubs
    http = Net::HTTP.new("www.meethue.com",443)
    http.use_ssl = true
    request = Net::HTTP::Get.new( "/api/nupnp" )
    response = http.request request
    
    case response.code.to_i
    when 200
      result = JSON.parse( response.body )
      result.each { |b| @bridges << HueBridge.new(b) } 
    else
      raise "Unknown error" 
    end
    @bridges
  end

  def register_username
    data = { "devicetype"=>"rubyhue",
              "username"=>@username }
    response = @http.post "/api", data.to_json
    result = JSON.parse(response.body).first
    if result.has_key? "error"
      process_error result
    end
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
    response = hue_get "lights/#{id}"
    HueBulb.new(id,response)
  end

  def request_group_info( id )
    response = hue_get "groups/#{id}"
    HueGroup.new(id,response)
  end

  def request_sensor_info( id )
    response = hue_get("sensors/#{id}")
    HueSensor.new(id,response)
  end

  def request_sensor_list
    hue_get "sensors"
  end

  def request_group_list
    hue_get "groups"
  end

  def request_schedule_list
    hue_get "schedules"
  end

  def set_bulb_state( id, state )
    hue_put "lights/#{id}/state", state
  end

  def set_group_state( id, state )
    hue_put "groups/#{id}/action", state
  end

private

  def process_error(result)
    type = result["error"]["type"]
    case type
    when 1
      raise HueUsernameException
    when 101
      raise HueBridgeConnectException
    else
      puts "Unknown Error."
    end
  end

  def hue_get( path )
    request = Net::HTTP::Get.new( "/api/#{@username}/#{path}" )
    response = @http.request request
    result = JSON.parse( response.body )
    if result.first.kind_of?(Hash) && result.first.has_key?("error")
      process_error result.first
    end
    result
  end

  def hue_put( path, data )
    response = @http.put( "/api/#{@username}/#{path}", data.to_json )
    JSON.parse response.body
  end

  def hue_post(path, data)
    response = @http.post("/api/#{@username}/#{path}", data.to_json)
    JSON.parse response.body
  end

end

