module Api
  class Error < RuntimeError
    attr_accessor :code
    attr_accessor :message

    def initialize(code, message_args = {})
      @message_args = message_args
      @code    = code
      @message = I18n.t "exceptions.#{code}.message", message_args
    end

    def as_json
      {
        error: {
          code: code,
          message: message
        }
      }
    end
  end
end
