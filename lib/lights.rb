#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

require 'lights/bridge'
require 'lights/exception'
require 'lights/datastore'
require 'lights/groupstate'
require 'lights/loggerconfig'

class Lights 

  attr_reader :bulbs, :username
  def initialize(ip,username=nil)
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
    http.use_ssl = true
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

  def register
    data = { "devicetype"=>"lights" }
    response = @http.post "/api", data.to_json
    result = JSON.parse(response.body).first
    if result.has_key? "error"
      process_error result
    elsif result["success"]
      @username = result["success"]["username"]
    end
    result
  end

  # backwards compatibility
  alias_method :register_username, :register

  def request_config
    get "config"
  end

  def add_bulb(id,bulb_data)
    @bulbs << Bulb.new( id, bulb_data )
  end

  def search_new
    post "lights"
  end

  def request_bulb_list
    get "lights"
  end

  def request_new_bulb_list
    get "lights/new"
  end

  def request_new_sensor_list
    get "sensors/new"
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

  def request_schedules
    get "schedules"
  end

  def request_datastore
    get ""
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

  def create_scene( scene )
    put "scenes/#{scene.id}", scene
  end

  def delete_group( id )
    delete "groups/#{id}"
  end

  def edit_bulb( bulb )
    put "lights/#{bulb.id}", bulb
  end

  def edit_group( group )
    put "groups/#{group.id}", group
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
    when 3
      raise ResourceUnavailableException, result["error"]["description"]
    when 6
      raise ParameterUnavailableException, result["error"]["description"]
    when 101
      raise BridgeConnectException
    else
      raise "Unknown Error: #{result["error"]["description"]}"
    end
  end

  def get( path )
    @logger.debug "==> GET: #{path}"
    raise UsernameException unless @username
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

  def put( path, data={} )
    @logger.debug "==> PUT: #{path}"
    raise UsernameException unless @username
    @logger.debug data.to_json 
    response = @http.put( "/api/#{@username}/#{path}", data.to_json )
    result = JSON.parse( response.body )
    @logger.debug "<== #{response.code}"
    @logger.debug response.body
    if result.first.kind_of?(Hash) && result.first.has_key?("error")
      process_error result.first
    end
    result
  end

  def post( path, data={} )
    @logger.debug "==> POST: #{path}"
    raise UsernameException unless @username
    @logger.debug data.to_json
    response = @http.post( "/api/#{@username}/#{path}", data.to_json )
    result = JSON.parse( response.body )
    @logger.debug "<== #{response.code}"
    @logger.debug response.body
    if result.first.kind_of?(Hash) && result.first.has_key?("error")
      process_error result.first
    end
    result
  end

  def delete( path )
    @logger.debug "==> DELETE: #{path}"
    raise UsernameException unless @username
    request = Net::HTTP::Delete.new( "/api/#{@username}/#{path}" )
    response = @http.request request
    result = JSON.parse( response.body )
    @logger.debug "<== #{response.code}"
    @logger.debug response.body
    if result.first.kind_of?(Hash) && result.first.has_key?("error")
      process_error result.first
    end
    result
  end

end

