module ErrorFormatter
  extend ActiveSupport::Concern

  def render_invalid(errors)
    render json: { errors: format_errors(errors) }, status: :unprocessable_entity
  end

  private

  def format_errors(errors)
    errors.messages.map do |field, messages|
      { field: field, message: messages.join(", ") }
    end
  end
end
