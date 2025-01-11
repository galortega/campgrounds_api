module Exceptions
  class Unauthorized < AuthenticationError
    def initialize(msg = "You must be logged in to access this resource")
      @message = msg
    end

    def message
      @message
    end
  end
end
