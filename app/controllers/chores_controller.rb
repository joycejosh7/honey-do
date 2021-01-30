class ChoresController < ApplicationController
    before_action :find_chore, only: [:show, :edit, :destroy, :update]

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
            flash[:error] = @chore.errors.full_messages
            render :new
        end
    end

    def edit
            
    end

    def update
        if @chore.update(chore_params)
            redirect_to chore_path(@chore)
        else  
            flash[:error] = @chore.errors.full_messages
            render :edit
        end
    end



private

    def chore_params
        params.require(:chore).permit(:title, :description)
    end

    def find_chore
        @chore = Chore.find_by_id(params[:id])
    end

end
