#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

require './huebulb'

HUE_IP    = "192.168.1.28"
USERNAME  = "tatersnakes"

def jp ( s )
  puts JSON.pretty_generate( s )
end

class PhillipsHueClient

  def initialize(ip,username)
    @ip = ip 
    @username = username
    @http = Net::HTTP.new(ip,80)
  end

  def hue_http_get( path )
    request = Net::HTTP::Get.new("/api/#{@username}/#{path}")
    response = @http.request request
    JSON.parse response.body
  end

  def request_bulb_list
    request = Net::HTTP::Get.new("/api/#{@username}/lights")
    response = @http.request(request)
    JSON.parse response.body 
  end

  def request_bulb_info( id )
    request = Net::HTTP::Get.new("/api/#{@username}/lights/#{id}")
    response = @http.request request
    JSON.parse response.body
  end

  def request_bulb_state( name )
    request = Net::HTTP::Get.new("/api/#{@username}/lights/#{name}/state")
    response = @http.request request
    JSON.parse response.body
  end

end

if __FILE__==$0
  hue_client = PhillipsHueClient.new(HUE_IP,USERNAME)
  bulbs_response = hue_client.request_bulb_list
  jp bulbs_response

  bulbs_response.each do |key,value|
    puts value["name"]
    #puts hue_client.request_bulb_state key 
    jp hue_client.request_bulb_info key
  end

end
