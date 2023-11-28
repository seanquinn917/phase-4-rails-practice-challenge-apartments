class TenantsController < ApplicationController

def index
 tenants=Tenant.all
 render json: tenants
end

def show
    tenant=Tenant.find_by(id: params[:id])
        if tenant 
            render json: tenant
        else 
            render_not_found_response
        end 
end

def create
    tenant= Tenant.create!(tenant_params)
    render json: tenant, status: :created
rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
end

def update
    tenant= Tenant.find_by(id: params[:id])
    if tenant
        tenant.update(tenant_params)
        render json: tenant, status: :accepted
    else
        render_not_found_response
    end
end


def destroy
    tenant=Tenant.find_by(id: params[:id])
    tenant.destroy
    head :no_content
end

private

def render_not_found_response
    render json: {error: "tenant not found"}, status: :not_found
end

def tenant_params
 params.permit(:name, :age)
end

end
