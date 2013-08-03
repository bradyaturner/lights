#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

HUE_IP    = "192.168.1.28"
USERNAME  = "tatersnakes"

def jsonp ( s )
  puts JSON.pretty_generate( s )
end

class PhillipsHueClient
  def initialize(ip,username)
    @uri = URI.parse(ip)
    @http = Net::HTTP.new(@uri.host,@uri.port)
    @username = username

  end

  def get_lights
    uri = URI.parse("http://#{HUE_IP}/api/#{USERNAME}/lights")
    http = Net::HTTP.new(uri.host,uri.port)
    request = Net::HTTP::Get.new(uri.path)
    response = http.request(request)
    response_json = JSON.parse( response.body )
  end
end

if __FILE__==$0
  client = PhillipsHueClient.new(HUE_IP,USERNAME)
  lights_response = client.get_lights
  jsonp lights_response
end
