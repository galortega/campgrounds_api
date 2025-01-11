module Exceptions
  class ValidationError < StandardError
    def initialize(msg = "Validation error")
      @message = msg
    end

    def message
      @message
    end
  end
end
