require File.expand_path('../cohber/error', __FILE__)
require File.expand_path('../cohber/configuration', __FILE__)
require File.expand_path('../cohber/api', __FILE__)
require File.expand_path('../cohber/client', __FILE__)

module Cohber
  extend Configuration

  # Alias for Cohber::Client.new
  #
  # @return [Cohber::Client]
  def self.client(options={})
    Cohber::Client.new(options)
  end

  # Delegate to Cohber::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Cohber::Client
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end