module V1
  class CampgroundsController < APIController
    allow_unauthenticated_access only: %i[ index show ]
    before_action :set_campground, only: %i[ show update destroy ]

    # GET /campgrounds
    # GET /campgrounds.json
    def index
      @campgrounds = Campground.search(params[:query])
      Campground.mark_favorited(@campgrounds, Current.user) if Current.user
    end

    # GET /campgrounds/1
    # GET /campgrounds/1.json
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
  end
end
