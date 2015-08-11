module Intelipost
  class Mash < ::Hashie::Mash
    def success?
      self.status == 'OK'
    end

    def failure?
      !success?
    end

    def all_messages
      self.messages.map(&:text).join(';')
    end
  end
end
