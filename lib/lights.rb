#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

require 'lights/bulb'
require 'lights/group'
require 'lights/bridge'
require 'lights/exception'
require 'lights/sensor'
require 'lights/scene'
require 'lights/user'
require 'lights/rule'
require 'lights/loggerconfig'

def jp( s )
  puts JSON.pretty_generate( s )
end

class Lights 

  attr_reader :bulbs
  def initialize(ip,username)
    @ip = ip 
    @username = username
    @http = Net::HTTP.new(ip,80)
    @bulbs = []
    @groups = []
    @bridges = []
    @logger = Logger.new(STDERR)
    @logger.level = LoggerConfig::LIGHTS_LEVEL
  end

  def discover_hubs
    http = Net::HTTP.new("www.meethue.com",443)
    http.use_ssl = tlights
    request = Net::HTTP::Get.new( "/api/nupnp" )
    response = http.request request
    
    case response.code.to_i
    when 200
      result = JSON.parse( response.body )
      result.each { |b| @bridges << Bridge.new(b) } 
    else
      raise "Unknown error" 
    end
    @bridges
  end

  def register_username
    data = { "devicetype"=>"lights",
              "username"=>@username }
    response = @http.post "/api", data.to_json
    result = JSON.parse(response.body).first
    if result.has_key? "error"
      process_error result
    end
  end

  def request_config
    get "config"
  end

  def add_bulb(id,bulb_data)
    @bulbs << Bulb.new( id, bulb_data )
  end

  def request_bulb_list
    get "lights"
  end

  def request_bulb_info( id )
    response = get "lights/#{id}"
    Bulb.new(id,response)
  end

  def request_group_info( id )
    response = get "groups/#{id}"
    Group.new(id,response)
  end

  def request_sensor_info( id )
    response = get "sensors/#{id}"
    Sensor.new(id,response)
  end

  def request_sensor_list
    get "sensors"
  end

  def request_group_list
    get "groups"
  end

  def request_schedule_list
    get "schedules"
  end

  def request_scene_list
    get "scenes"
  end
  
  def request_config
    get "config"
  end

  def request_rules
    get "rules"
  end

  def set_bulb_state( id, state )
    put "lights/#{id}/state", state
  end

  def set_group_state( id, state )
    put "groups/#{id}/action", state
  end

  def create_group( group )
    post "groups", group
  end

  def delete_group( id )
    delete "groups/#{id}"
  end

  def delete_user( username )
    delete "config/whitelist/#{username}"
  end

private
  def process_error(result)
    type = result["error"]["type"]
    case type
    when 1
      raise UsernameException
    when 101
      raise BridgeConnectException
    else
      puts "Unknown Error."
    end
  end

  def get( path )
    @logger.debug "==> GET: #{path}"
    request = Net::HTTP::Get.new( "/api/#{@username}/#{path}" )
    response = @http.request request
    result = JSON.parse( response.body )
    @logger.debug "<== #{response.code}"
    @logger.debug response.body
    if result.first.kind_of?(Hash) && result.first.has_key?("error")
      process_error result.first
    end
    result
  end

  def put( path, data )
    @logger.debug "==> PUT: #{path}"
    @logger.debug data.to_json 
    response = @http.put( "/api/#{@username}/#{path}", data.to_json )
    @logger.debug "<== #{response.code}"
    @logger.debug response.body
    JSON.parse response.body
  end

  def post( path, data )
    @logger.debug "==> POST: #{path}"
    @logger.debug data.to_json
    response = @http.post( "/api/#{@username}/#{path}", data.to_json )
    @logger.debug "<== #{response.code}"
    @logger.debug response.body
    JSON.parse response.body
  end

  def delete( path )
    @logger.debug "==> DELETE: #{path}"
    request = Net::HTTP::Delete.new( "/api/#{@username}/#{path}" )
    response = @http.request request
    @logger.debug "<== #{response.code}"
    @logger.debug response.body
    JSON.parse response.body
  end

end

