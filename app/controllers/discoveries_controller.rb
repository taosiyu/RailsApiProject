class DiscoveriesController < ApplicationController
  before_action :set_discovery, only: [:show, :update, :destroy]

  # GET /discoveries
  def index

    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)

    @discoveries = Discovery.all.page(page_number).per(per_page)

    # cache
    expires_in 30.seconds, public: true

    if stale?(etag: @cards)
      render json: @discoveries, adapter: :json_api
    end
  end

  # GET /discoveries/1
  def show
    render json: @discovery, adapter: :json
  end

  # POST /discoveries
  def create
    @discovery = Discovery.new(discovery_params)

    if @discovery.save
      render json: @discovery, status: :created, location: @discovery
    else
      render json: @discovery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /discoveries/1
  def update
    if @discovery.update(discovery_params)
      render json: @discovery
    else
      render json: @discovery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /discoveries/1
  def destroy
    @discovery.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discovery
      @discovery = Discovery.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def discovery_params
      params.require(:discovery).permit(:title, :content, :type, :image)
    end
end
