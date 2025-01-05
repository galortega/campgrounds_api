module V1
  class SessionsController < APIController
    allow_unauthenticated_access_only only: %i[ create ]

    def new
    end

    # POST /v1/sessions
    # This action creates a new session for the user.
    # Params:
    # +email_address+:: the email address of the user
    # +password+:: the password of the user
    # Response:
    # +token+:: the session token
    def create
      if user = User.authenticate_by(email_address: params[:email_address], password: params[:password])
        session = user.sessions.create!(user_agent: request.user_agent, ip_address: request.remote_ip)
        render json: { token: session.token }, status: :created
      else
        render json: { error: "Invalid credentials" }, status: :unauthorized
      end
    end

    # DELETE /v1/sessions
    # This action destroys the current session.
    # It uses the Current module to access the current session.
    # Response:
    # 204 No Content
    def destroy
      Current.session.destroy
      head :no_content
    end
  end
end
