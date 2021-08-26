class CharactersController < ApplicationController
    def index 
        characters = Character.all
        render json: characters
    end
    
    def create 
        character = Character.create(character_params)
        render json: character
    end

    def update
        character = Character.find(params[:id])
        character.update(character_params)
        render json: character
    end

    def destroy
        character = Character.find(params[:id])
        character.destroy
        render json: character
    end

    private
    def character_params
        params.require(:character).permit(:name, :age, :enjoys)
    end
end
