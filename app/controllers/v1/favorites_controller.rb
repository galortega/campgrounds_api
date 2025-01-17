module V1
  class FavoritesController < ApplicationController
    before_action :set_favorite, only: %i[ show update destroy ]

    # GET /favorites
    # GET /favorites.json
    # This action fetches a list of favorites for the current user.
    # It uses the Current module to access the current user.
    def index
      @favorites = Current.user.favorites.all
    end

    # GET /favorites/1
    # GET /favorites/1.json
    def show
    end

    # POST /favorites
    # POST /favorites.json
    # This action creates a new favorite for the current user.
    # It uses the Current module to access the current user.
    # Params:
    # +campground_id+:: the ID of the campground to favorite
    def create
      @favorite = Current.user.favorites.new(favorite_params)

      if @favorite.save
        render :show, status: :created, location: [ :v1, @favorite ]
      else
        puts @favorite.errors.full_messages
        raise Exceptions::ValidationError.new(@favorite.errors.full_messages.join(", "))
      end
    end

    # PATCH/PUT /favorites/1
    # PATCH/PUT /favorites/1.json
    def update
      if @favorite.update(favorite_params)
        render :show, status: :ok, location: [ :v1, @favorite ]
      else
        raise Exceptions::ValidationError.new(@favorite.errors.full_messages.join(", "))
      end
    end

    # DELETE /favorites/1
    # DELETE /favorites/1.json
    # This action deletes a favorite for the current user.
    # It uses the Current module to access the current user.
    # Params:
    # +id+:: the ID of the favorite to delete
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
        params.expect(favorite: [ :campground_id ])
      end
  end
end
