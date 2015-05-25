module Intelipost
  class Client
    HOST        = 'api.intelipost.com.br'
    SERVICE     = 'api/'
    API_VERSION = 'v1'
    attr_reader :uri, :options, :connection, :api_key

    def initialize(options)
      @options = {ssl: true}
      @options.merge! options
      uri = @options[:ssl] ? 'https://' : 'http://'
      uri.concat HOST

      @uri = URI.join uri, SERVICE, API_VERSION
      @api_key = @options[:api_key]

      @connection = connection
    end

    def connection
      raise ArgumentError, 'an api_key is required to connect' if api_key.nil?
      Faraday.new(url: @uri.to_s) do |conn|
        conn.request :json

        conn.response :mashify
        conn.response :json

        conn.headers['api_key'] = api_key
        conn.adapter Faraday.default_adapter
        conn.proxy @options[:proxy]
      end
    end

    def get(endpoint, args={})
      connection.get(endpoint, args).body
    end

    def post(endpoint, args = {})
      connection.post(endpoint, args).body
    end

    def method_missing(method, *args, &block)
      method = camelize method
      if Intelipost.const_defined? method
        return Intelipost.const_get(method).new self
      else
        super
      end
    end

    def camelize(term)
      string = term.to_s
      string = string.sub(/^[a-z\d]*/) { $&.capitalize }
      string.gsub!(/(?:_|(\/))([a-z\d]*)/i) { "#{$1}#{$2.capitalize}" }
      string.gsub!('/', '::')
      string
    end
  end
end
