class ApplicationController < ActionController::API
  include ActionView::Layouts
  include APIException::Handler
  include Authentication
  include ErrorFormatter
end
