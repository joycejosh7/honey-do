class ChoresController < ApplicationController
    before_action :find_chore, only: [:show, :edit, :update, :destroy]

    def index
        @chores = Chore.all
    end

    def show
    end
    
    def new
        @chore = Chore.new
    end

    def create
        @chore = Chore.new(chore_params)
        if @chore.save
            # what to do if it is valid
            redirect_to chores_path
        else  
            # what to do if it is invalid
            flash.now[:error] = @chore.errors.full_messages
            render :new
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

    def chore_params
        params.require(:chore).permit(
            :title, 
            :room_id, 
            :description, 
            room_attributes: [:name]
            )
    end


end
