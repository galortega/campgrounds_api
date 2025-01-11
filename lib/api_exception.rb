# = APIException
# This module centralizes handling of pre-defined exceptions
# For use, include APIException::Handler on your controller
# For delegate all of application error, Simply include the handler on your ApplicationController
#
module APIException
  # = EXCEPTIONS
  # You can define your own exception on here.
  #
  EXCEPTIONS = {
    # 400
    "ActiveRecord::RecordInvalid" => { status: 400, error_code: 40001, message: "Invalid request" },
    "BadRequest" => { status: 400, error_code: 40002, message: "Your own message in here" },
    "ActionController::ParameterMissing" => { status: 400, error_code: 40003, message: "Parameter missing" },

    # 401
    "Exceptions::InvalidCredentials" => { status: 401, error_code: 40101, message: "Invalid credentials" },
    "Exceptions::Unauthorized" => { status: 401, error_code: 40102, message: "Unauthorized" },

    # 403
    "Forbidden" => { status: 403, error_code: 40301, message: "Your own message in here" },

    # 404
    "ActiveRecord::RecordNotFound" => { status: 404, error_code: 40401, message: "Cannot find record" },
    "NotFound" => { status: 404, error_code: 40402, message: "Your own message in here" },

    # 422
    "Exceptions::ValidationError" => { status: 422, error_code: 42201, message: "Validation error" }

  }

  class BaseError < StandardError
    def initialize(msg = nil)
      @message = msg
    end

    def message
      @message || nil
    end
  end

  module Handler
    def self.included(klass)
      klass.class_eval do
        EXCEPTIONS.each do |exception_name, context|
          unless APIException.const_defined?(exception_name)
            APIException.const_set(exception_name, Class.new(BaseError))
            exception_name = "APIException::#{exception_name}"
          end

          rescue_from exception_name do |exception|
            render status: context[:status], json: { error_code: context[:error_code], message: context[:message], error: (exception.message), data: nil }.compact
          end
        end
      end
    end
  end
end
