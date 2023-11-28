class LeasesController < ApplicationController

def create
    lease=Lease.create!(lease_params)
    render json: lease, status: :created
rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
end



def destroy
    lease= Lease.find_by(id: params[:id])
    lease.destroy
    head :no_content
end


private

def lease_params
    params.permit(:rent,:tenant_id, :apartment_id)
end




end
