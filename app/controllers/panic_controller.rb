class PanicController < ApplicationController
    def panic_update
        requested_update = Panic.create(new_panic_params)
        render json: requested_update
    end

    def panic_current
        render json: Panic.last
    end
    
    private

    def new_panic_params
        params.require(:panic).permit(:status,:reason)
    end 
end
