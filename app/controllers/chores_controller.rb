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
            redirect_to chores_path
        else  
            render :new
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
