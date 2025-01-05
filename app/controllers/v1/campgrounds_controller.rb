module V1
  class CampgroundsController < APIController
    allow_unauthenticated_access only: %i[ index show ]
    before_action :set_campground, only: %i[ show update destroy ]

    # GET /campgrounds
    # GET /campgrounds.json
    # This action fetches a list of campgrounds based on the query parameters provided.
    # It uses caching to store the results for 1 hour to improve performance.
    # If the user is authenticated, it marks the campgrounds as favorited for the current user.
    # Params:
    # +query+:: a string containing the search query for campgrounds
    def index
      cache_key = generate_cache_key params[:query]
      @campgrounds = Rails.cache.fetch(cache_key, expires_in: 1.hours) do
        campgrounds = Campground.search(params[:query])
        campgrounds
      end
      Campground.mark_favorited(@campgrounds, Current.user) if Current.user
    end


    # GET /campgrounds/1
    # GET /campgrounds/1.json
    # This action fetches a single campground based on the ID provided.
    # If the user is authenticated, it marks the campground as favorited for the current user.
    # Params:
    # +id+:: the ID of the campground to fetch
    # +query+:: a string containing the search query for campgrounds
    def show
      Campground.mark_favorited(@campground, Current.user) if Current.user
    end

    # POST /campgrounds
    # POST /campgrounds.json
    def create
      @campground = Campground.new(campground_params)

      if @campground.save
        render :show, status: :created, location: [ :v1, @campground ]
      else
        render json: @campground.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /campgrounds/1
    # PATCH/PUT /campgrounds/1.json
    def update
      if @campground.update(campground_params)
        render :show, status: :ok, location: [ :v1, @campground ]
      else
        render json: @campground.errors, status: :unprocessable_entity
      end
    end

    # DELETE /campgrounds/1
    # DELETE /campgrounds/1.json
    def destroy
      @campground.destroy!
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_campground
        @campground = Campground.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def campground_params
        params.require(:campground).permit(:name, :location, :description, :price)
      end

      def generate_cache_key(query)
        "campgrounds:#{query}"
      end
  end
end
