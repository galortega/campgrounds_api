module Exceptions
  class InvalidCredentials < AuthenticationError
    def initialize(msg = "You entered an invalid email or password")
      @message = msg
    end

    def message
      @message
    end
  end
end
