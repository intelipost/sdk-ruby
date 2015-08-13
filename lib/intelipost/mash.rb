module Intelipost
  class Mash < ::Hashie::Mash
    def success?
      self.has_key?('status') and self.status == 'OK'
    end

    def failure?
      !success?
    end

    def all_messages
      return unless self.has_key?('messages')
      self.messages.map(&:text).join(';')
    end
  end
end
