module Intelipost
  class QuoteByProduct < Intelipost::FluentInterfaceBase
    set_endpoint 'quote_by_product'

    def get(value)
      connection.get([@fluent_interfaces, value].join('/').sub('quote_by_product','quote'))
    end
  end

end
