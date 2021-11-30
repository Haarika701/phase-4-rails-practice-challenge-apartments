class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid,with: :render_try_again
    def index
        apartments = Apartment.all 
        render json:apartments
    end

    def create
        apartments = Apartment.create(apartment_params)
        render json:apartments
    end

    def update
        apartments = Apartment.find(params[:id])
        apartments.update(apartment_params)
        render json:apartments,status: :created
    end

    def destroy
        apartments = Apartment.find(params[:id])
        apartments.destroy
        head :no_content,status: :ok
    end

    private

    def apartment_params
        params.permit(:number)
    end

    def render_try_again
        render json:{error: "not found"},status: :not_found
    end
end
