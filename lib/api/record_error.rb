module Api
  class RecordError < DetailedError
    def initialize(code, record, message_args = {})
      super code, record.errors, message_args
    end
  end
end
