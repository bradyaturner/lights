#!/usr/bin/env ruby

# Nanoleaf API: http://forum.nanoleaf.me/docs/openapi
# mDNS discovery: http://soohwan.blogspot.com/2011/02/rubys-mdns-dnssd.html

require 'dnssd' #v2.0.1

TYPE = "_nanoleafapi._tcp."

class AuroraDiscoverer
  def initialize
    @found = false
    @search_count = 0
  end

  def discover
    services = []
    DNSSD.browse! TYPE do |reply|
      puts "Time: #{Time.new.to_f} reply: #{reply.fullname}"
      services << reply
      next if reply.flags.more_coming?

      services.each do |service|
        resolve service
      end
      break  
    end
  end

  def node_resolver(node,resolved)
    puts "Inside node resolver"
    address = get_device_address(resolved)
    puts "AFTER"

    puts "#{node.name}: #{address}"
    @found = true

    resolved.flags.more_coming?
  end

  def resolve(service)
    puts "Resolving #{service.fullname}"
    #loop do
      status = DNSSD.resolve!(service) do |resolved|
        puts "INSIDE"
        break unless node_resolver(service, resolved)
      end
      #sleep 0.1
      #break if @found
      #@search_count += 1
    #end
    puts "END OF RESOLVE, search_count: #{@search_count}"
  end

  def get_device_address(resolved)
    host = get_device_host(resolved.target)
    "#{host}:#{resolved.port}"
  end

  def get_device_host(target)
    info = Socket.getaddrinfo(target, nil, Socket::AF_INET)
    info[0][2]
  rescue SocketError
    target
  end
  
  def run
    discover
  end
end

if __FILE__==$0
  ad = AuroraDiscoverer.new
  ad.run
end
