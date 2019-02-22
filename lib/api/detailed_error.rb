module Api
  class DetailedError < Error
    attr_accessor :details

    def initialize(code, details, message_args = {})
      super code, message_args
      @details = details
    end

    def as_json
      json = super
      json[:error][:details] = details
      json
    end
  end
end
