class CardsController < ApplicationController

  before_action :set_card, only: [:show, :update, :destroy]

  def search
    @cards = Card.where("user_id = ?", params[:user_id]).take(10)

    render json: @cards
  end

  # GET /cards
  def index

    page_number = params[:page].try(:[], :number)
    per_page = params[:page].try(:[], :size)

    @cards = Card.all.page(page_number).per(per_page)

    # cache
    expires_in 30.seconds, public: true

    if stale?(etag: @cards)
      render json: @cards, include: [:comment], adapter: :json_api
    end
  end

  # GET /cards/1
  def show
    render json: @card, include: [:user], adapter: :json, meta: User.find_by(:id => @card.user_id)
  end

  # POST /cards
  def create

    card_params2[:images] = params[:file]
    puts card_params2
    @card = Card.new(card_params2)


    if @card.save
      render json: @card, status: :created, location: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cards/1
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def card_params
      params.require(:card).permit(:title, :detail, :content, :clicks, :images, :type, :other, :user_id)
    end

    def card_params2
      # image = params[:file]
      request_param = params.permit(:title, :content, :images, :user_id)
      # request_param[:images] = image
      request_param
    end
end
