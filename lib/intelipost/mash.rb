module Intelipost
  class Mash < ::Hashie::Mash
    def success?
      return false unless self.has_key?('status')
      self.status == 'OK'
    end

    def failure?
      !success?
    end

    def all_messages
      return false unless self.has_key?('messages')
      self.messages.map(&:text).join(';')
    end
  end
end
