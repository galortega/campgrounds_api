class ApplicationController < ActionController::API
  include Authentication
  include ErrorFormatter
end
