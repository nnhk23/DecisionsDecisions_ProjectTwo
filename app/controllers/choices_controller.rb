class ChoicesController < ApplicationController
    def show
        @choice = Choice.find(params[:id])
    end

    def new
        @choice = current_user.choices.build
    end

    def create
        @choice = current_user.choices.create(choice_params)
        if @choice.save
            redirect_to activities_path
        else
            render :new
        end
    end

    private
    def choice_params
        params.require(:choice).permit(:choice_name, :date, :completed, :location_zip)
    end
end
