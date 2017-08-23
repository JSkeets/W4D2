class CatRentalRequestController < ApplicationController


    def index
      @catrequest = CatRentalRequest.all
      render :index
    end

    def show
      @catrequest = CatRentalRequest.find_by(id: params[:id])

      if @catrequest
        render :show
      else
        puts "no request there"
      end
    end

    def new

      @catrequest = CatRentalRequest.new
      render :new
    end

    def create
      @catrequest = CatRentalRequest.new(cat_request_params)
      if @catrequest.save
        redirect_to cat_rental_requests_url
      else
        render :new
      end
    end

    def edit

      @catrequest = CatRentalRequest.find_by(id: params[:id])
      if @catrequest
        render :edit
      else
        redirect_to :index
      end
    end

    def update
      @catrequest = CatRentalRequest.find_by(id: params[:id])
      if @catrequest.update_attributes(cat_request_params)
        redirect_to cat_rental_request_url(@catrequest)
      else
        render :edit
      end
    end

    private

    def cat_request_params
      params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id, :status)
    end
end
