require 'rest_client'
require 'multi_json'

require "streak/version"

require "streak/streak_error"
require "streak/util"

require "streak/streak_object"
require "streak/box"
require "streak/field"
require "streak/field_value"
require "streak/pipeline"
require "streak/stage"
require "streak/user"
require "streak/search"
require "streak/file"

module Streak
  @api_base = "https://www.streak.com/api/v1"

  # @ssl_bundle_path  = File.dirname(__FILE__) + '/data/ca-certificates.crt'
  # @verify_ssl_certs = true
  #

  class << self
    attr_accessor :api_key, :api_base, :verify_ssl_certs
  end

  def self.api_url(url='')
    @api_base + url
  end

  def self.request(method, url, params = {}, headers = {})
    http_method = method.to_s.downcase.to_sym
    case http_method
    when :get, :head, :delete
      # Make params into GET parameters
      url += "#{URI.parse(url).query ? '&' : '?'}#{uri_encode(params)}" if params && params.any?
      payload = nil
    else
      payload = params.is_a?(String) ? params : uri_encode(params)

      if http_method == :post
        headers[:content_type] ||= "application/json"
      end
    end

    request_opts = {
      :headers => headers,
      :method => method,
      :verify_ssl => false,
      :url  => api_url(url),
      :user => api_key,
      :payload => payload
    }

    begin
      response = execute_request(request_opts)
      handle_api_error(response.code, response.body) unless response.code == 200
    rescue RestClient::ExceptionWithResponse => e
      if rcode = e.http_code and rbody = e.http_body
        handle_api_error(rcode, rbody)
      else
        raise
      end
    end

    parse(response)
  end

  def self.execute_request(opts)
    RestClient::Request.execute(opts)
  end

  def self.handle_api_error(rcode, rbody)
    case rcode
    when 400, 404
      raise InvalidRequestError.new("Your request is invalid: #{rbody.inspect}", rcode, rbody)
    when 401
      raise AuthenticationError.new("Your API key is invalid: #{rbody.inspect}", rcode, rbody)
    else
      raise APIError.new("API Error: #{rbody.inspect}", rcode, rbody)
    end
  end

  def self.parse(response)
    begin
      response = MultiJson.load(response.body)
    rescue MultiJson::DecodeError
      raise APIError.new("Invalid response from the API: #{response.body.inspect}")
    end
  end

  private

  def self.uri_encode(params)
    params.map { |k,v| "#{k}=#{URI.escape(v)}" }.join("&")
  end

end
