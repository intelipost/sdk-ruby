module Intelipost
  module FluentInterface
    module ClassMethods
      def set_endpoint endpoint
        define_method :endpoint do
          endpoint
        end
      end
    end

    module InstanceMethods
      def method_missing(method, *args, &block)
        uri = [endpoint, method, args].join '/'
        connection.get uri
      end
    end
  end

  class FluentInterfaceBase
    extend Intelipost::FluentInterface::ClassMethods
    include Intelipost::FluentInterface::InstanceMethods
    attr_accessor :connection

    def initialize(connection)
      @connection = connection
    end

    def spawn
      clone
    end
  end
end
