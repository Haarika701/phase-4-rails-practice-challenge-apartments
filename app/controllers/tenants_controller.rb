class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid,with: :render_try_again
    def index
        tenants = Tenant.all 
        render json:tenants
    end

    def create
        tenants = Tenant.create(apartment_params)
        render json:tenants
    end

    def update
        tenants = Tenant.find(params[:id])
        tenants.update(tenant_params)
        render json:tenants,status: :created
    end

    def destroy
        tenants = Tenant.find(params[:id])
        tenants.destroy
        head :no_content,status: :ok
    end

    private

    def tenant_params
        params.permit(:name,:age)
    end

    def render_try_again
        render json:{error: "not found"},status: :not_found
    end
end


