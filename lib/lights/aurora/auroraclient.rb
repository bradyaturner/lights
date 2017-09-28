#!/usr/bin/env ruby

require 'net/http'
require 'json'
require 'logger'
require './auroradiscoverer'
require './auroradevice'
require './exception'
require_relative '../loggerconfig'

PATH_PREFIX = "/api/v1/"

class AuroraClient
  attr_writer :auth_token
  def initialize(ip,port)
    @ip = ip
    @http = Net::HTTP.new(ip,port)
    @logger = Logger.new(STDERR)
    @logger.level = LoggerConfig::AURORACLIENT_LEVEL
  end

  def authorize
    data = post "new"
    @auth_token = data["auth_token"]
  end

  def get_all_info
    data = get ""
  end

  def get_effects_list
    data = get "effects/effectsList"
  end

  def select_effect(effect)
    put("effects", {"select"=>effect})
  end

  def turn_on
    put("state/on", {"on"=>{"value"=>true}})
  end

  def turn_off
    put("state/on", {"on"=>{"value"=>false}})
  end

private
  def get( path )
    @logger.debug "==> GET: #{path}"
    raise AuroraAuthorizationException unless @auth_token
    request = Net::HTTP::Get.new( "#{PATH_PREFIX}#{@auth_token}/#{path}" )
    response = @http.request request
    @logger.debug "<== #{response.code}"
    @logger.debug response.body
    JSON.parse( response.body )
  end

  def put( path, data={} )
    @logger.debug "==> PUT: #{path}"
    raise AuroraAuthorizationException unless @auth_token
    @logger.debug data.to_json
    response = @http.put( "#{PATH_PREFIX}#{@auth_token}/#{path}", data.to_json )
    @logger.debug "<== #{response.code}"
    @logger.debug response.body
    if response.code == 200
      JSON.parse( response.body )
    else
      response.body
    end
  end

  def post( path, data={} )
    @logger.debug "==> POST: #{path}"
    @logger.debug data.to_json
    response = @http.post( "#{PATH_PREFIX}#{path}", data.to_json )
    @logger.debug "<== #{response.code}"
    raise AuroraConnectionException if response.code.to_i == 403
    @logger.debug response.body
    JSON.parse( response.body )
  end
end

AURORA_CONFIG_PATH = "#{ENV["HOME"]}/.auroraconfig"
class ConfigHelper
  attr_reader :config
  def initialize
    if File.exists? AURORA_CONFIG_PATH
      @config = JSON.parse( IO.read( AURORA_CONFIG_PATH ) )
    end
  end

  def write_config
    File.open(AURORA_CONFIG_PATH,"w+") { |file| file.write(@config.to_json) }
  end
end

if __FILE__==$0
  ad = AuroraDiscoverer.new
  ad.discover
  a1 = ad.devices.first

  ch = ConfigHelper.new
  client = AuroraClient.new(a1.ip,a1.port)

  #client.authorize
  client.auth_token = ch.config["auth_token"]
  puts JSON.pretty_generate client.get_all_info
  #client.turn_off
  #sleep 2
  #client.turn_on
  #effects = client.get_effects_list
  #puts effects.inspect
  #effect = effects[rand(effects.length)]
  #puts "Selected #{effect}"
  #client.select_effect effect
end
