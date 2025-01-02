module V1
  class SessionsController < APIController
    allow_unauthenticated_access only: %i[ create ]

    def new
    end

    def create
      if user = User.authenticate_by(email_address: params[:email_address], password: params[:password])
        session = user.sessions.create!(user_agent: request.user_agent, ip_address: request.remote_ip)
        render json: { token: session.token }, status: :created
      else
        render json: { error: "Invalid credentials" }, status: :unauthorized
      end
    end

    def destroy
      Current.session.destroy
      head :no_content
    end
  end
end
