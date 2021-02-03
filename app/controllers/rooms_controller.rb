class RoomsController < ApplicationController

    def index
        @rooms = Room.all
    end

    def show
        @room = Room.find_by_id(params[:id])
    end

    def new
        @room = Room.new
        @room.chores.build
    end

    def create
        @room = Room.new(room_params)

        if @room.save
            redirect_to chores_path
        else  
            render :new
        end
    end

    private

        def room_params
            params.require(:room).permit(
            :name, 
            chores_attributes: [:title, :description]
            )
        end

end
