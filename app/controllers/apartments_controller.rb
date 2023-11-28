class ApartmentsController < ApplicationController

def index
    apartments = Apartment.all 
    render json: apartments
end

def show
    apartment = Apartment.find_by(id: params[:id])
    if apartment
        render json: apartment
    else 
        render_not_found_response
    end
end

def create
    apartment= Apartment.create!(apartment_params)
    render json: apartment, status: :created
rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
end

def update
    apartment=Apartment.find_by(id: params[:id])
    if apartment
        apartment.update(apartment_params)
        render json: apartment, status: :accepted
    else
        render_not_found_response
    end
end

def destroy
    apartment=Apartment.find_by(id: params[:id])
    apartment.destroy
    head :no_content
end 



private

def render_not_found_response
    render json: {error: "apartment not found"}, status: :not_found
end

def apartment_params
    params.permit(:number)
end

end
