class CatsController < ApplicationController
    def index 
        @cats = Cat.all 
        render :index, status: 200
    end

    def show
        @cat = Cat.find_by(id: params[:id])

        render :show, status: 200
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create
        @cat = Cat.new(cat_params)

        if @cat.save
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 418
        end
    end

    def edit
        @cat = Cat.find_by(id: params[:id])

        render :edit
    end

    def update
        @cat = Cat.find_by(id: params[:id])

        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            redirect_to edit_cat_url(@cat)
        end
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
    end
end
