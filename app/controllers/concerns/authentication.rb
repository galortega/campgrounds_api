module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :require_authentication
    after_action :refresh_session
  end

  class_methods do
    def allow_unauthenticated_access_only(**options)
      skip_before_action :require_authentication, **options
    end

    def allow_unauthenticated_access(**options)
      before_action :authenticate_if_possible, **options
      skip_before_action :require_authentication, **options
    end
  end

  private
    def require_authentication
      resume_session || render_unauthorized
    end

    def authenticate_if_possible
      resume_session
    end

    def resume_session
      token = request.headers["Authorization"]&.split(" ")&.last
      Current.session = Session.find_by(token: token)
    end

    def refresh_session
      if Current.session && !Current.session.destroyed?
        Current.session.regenerate_token!
        response.set_header("Authorization", "Bearer #{Current.session.token}")
      end
    end

    def render_unauthorized
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
end
