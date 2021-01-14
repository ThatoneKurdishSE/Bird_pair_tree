class ApplicationController < ActionController::API

    def index
        @birds = Bird.all
        render json: @birds
    end

    def show
        @bird = Bird.find(params[:id])
        render json: @bird
    end

    def create
        @bird = Bird.create(name: params[:name], breed: params[:breed])
        render json: @bird
    end
    def update
        @bird = Bird.find(params[:id])
        @bird.update(name: params[:name], breed: params[:breed])
        render json: @bird
    end

    def destroy
        @bird = Bird.find(params[:id])
        @bird.destroy
    end

    def index
        @trees = Tree.all
        render json: @trees, include: :bird
    end
    def show
        @tree = Tree.find(params[:id])
        render json: @tree, include: :bird
    end

    def create
        @tree = Tree.create(variety: params[:variety], bird: params[:bird])
        render json: @tree
    end

    def update
        @tree = Tree.find(params[:id])
        @tree = Tree.update(variety: params[:variety], bird: params[:bird])
        render json: @tree
    end

    def destroy
        @tree = Tree.find(params[:id])
        @tree.destroy
    end
end
