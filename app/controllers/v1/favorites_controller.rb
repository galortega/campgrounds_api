module V1
  class FavoritesController < ApplicationController
    before_action :set_favorite, only: %i[ show update destroy ]

    # GET /favorites
    # GET /favorites.json
    def index
      @favorites = Current.user.favorites.all
    end

    # GET /favorites/1
    # GET /favorites/1.json
    def show
    end

    # POST /favorites
    # POST /favorites.json
    def create
      @favorite = Current.user.favorites.new(favorite_params)

      if @favorite.save
        render :show, status: :created, location: [ :v1, @favorite ]
      else
        render_invalid @favorite.errors
      end
    end

    # PATCH/PUT /favorites/1
    # PATCH/PUT /favorites/1.json
    def update
      if @favorite.update(favorite_params)
        render :show, status: :ok, location: [ :v1, @favorite ]
      else
        render json: @favorite.errors, status: :unprocessable_entity
      end
    end

    # DELETE /favorites/1
    # DELETE /favorites/1.json
    def destroy
      @favorite.destroy!
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_favorite
        @favorite = Favorite.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def favorite_params
        params.expect(favorite: [ :user_id, :campground_id ])
      end
  end
end
