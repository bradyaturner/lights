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
    data = post("new")
    @auth_token = data["auth_token"]
  end

  def get_all_info
    data = get("/")
    @logger.debug JSON.pretty_generate data
  end

private
  def get( path )
    @logger.debug "==> GET: #{path}"
    raise AuroraAuthorizationException unless @auth_token
    request = Net::HTTP::Get.new( "#{PATH_PREFIX}#{@auth_token}/#{path}" )
    response = @http.request request
    @logger.debug "<== #{response.code}"
    result = JSON.parse( response.body )
    @logger.debug response.body
    result
  end

  def post( path, data={} )
    @logger.debug "==> POST: #{path}"
    @logger.debug data.to_json
    response = @http.post( "#{PATH_PREFIX}#{path}", data.to_json )
    @logger.debug "<== #{response.code}"
    raise AuroraConnectionException if response.code.to_i == 403
    result = JSON.parse( response.body )
    @logger.debug response.body
    result
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
  devices = ad.devices
  a1 = devices.first

  puts a1.name
  puts a1.ip
  puts a1.port

  ch = ConfigHelper.new

  client = AuroraClient.new(a1.ip,a1.port)
  #client.authorize
  client.auth_token = ch.config["auth_token"]
  client.get_all_info
end
