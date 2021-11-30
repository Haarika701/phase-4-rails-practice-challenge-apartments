class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid,with: :render_try_again
    def create
        lease = Lease.create(lease_params)
        render json:lease,status: :created
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content,status: :ok
    end

    private

def lease_params
        params.permit(:rent,:apartment_id,:tenant_id)
    end

    def render_try_again
        render json:{error: "not found"},status: :not_found
    end
end
