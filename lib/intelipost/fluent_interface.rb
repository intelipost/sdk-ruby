module Intelipost
  module FluentInterface

    def self.included(cls)
      cls.extend(ClassMethods)
    end

    def create(post_values)
      connection.post(endpoint, post_values)
    end

    def get(value)
      connection.get [endpoint, value].join '/'
    end

    def method_missing(method, *args, &block)
      connection.get [endpoint, method, args].join '/'
    end

    module ClassMethods
      def set_endpoint endpoint
        define_method :endpoint do
          endpoint
        end
      end
    end
  end

  class FluentInterfaceBase
    include Intelipost::FluentInterface
    attr_accessor :connection

    def initialize(connection)
      @connection = connection
    end

    def spawn
      clone
    end
  end
end
