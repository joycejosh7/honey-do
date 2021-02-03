class ChoresController < ApplicationController
    before_action :find_room, only: [:index, :new, :create]
    before_action :find_chore, only: [:show, :edit, :update, :destroy]

    def index
        if @room
            @chores = @room.chores
        else  
            @chores = Chore.all
        end
    end

    def show
    end
    
    def new
        if @room
            @chore = @room.chores.build
            render :new_room_chore    
        else
            @chore = Chore.new
        end
    end

    def create
        @chore = Chore.new(chore_params)
        if @chore.save
            # what to do if it is valid
            redirect_to chores_path
        else  
            # what to do if it is not valid
            flash.now[:error] = @chore.errors.full_messages
            
            if @room
                render :new_room_chore
            else  
                render :new
            end
        end
    end

    def edit       
    end

    def update
        if @chore.update(chore_params)
            redirect_to chore_path(@chore)
        else  
            flash.now[:error] = @chore.errors.full_messages
            render :edit
        end
    end

    def destroy
        @chore.destroy
        flash[:notice] = "#{@chore.title} was deleted!"
        redirect_to chores_path
    end



    private

    def find_chore
        @chore = Chore.find_by_id(params[:id])
    end

    def find_room
        if params[:room_id]
            @room = Room.find_by_id(params[:room_id])
        end
    end

    def chore_params
        params.require(:chore).permit(
            :title, 
            :room_id, 
            :description, 
            room_attributes: [:name]
            )
    end


end
