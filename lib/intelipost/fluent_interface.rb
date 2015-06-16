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
      def create(post_values)
        connection.post(@fluent_interfaces.join('/'), post_values)
      end

      def update(post_values)
        create(post_values)
      end

      def get(value)
        connection.get([@fluent_interfaces, value].join('/'))
      end

      def method_missing(method, *args, &block)
        add_fluent_interface_path(method)
        self
      end

      private
      def add_fluent_interface_path(method)
        @fluent_interfaces << method
      end
    end
  end

  class FluentInterfaceBase
    extend Intelipost::FluentInterface::ClassMethods
    include Intelipost::FluentInterface::InstanceMethods
    attr_accessor :connection

    def initialize(connection)
      @connection = connection
      @fluent_interfaces = [endpoint]
    end

    def spawn
      clone
    end
  end
end
