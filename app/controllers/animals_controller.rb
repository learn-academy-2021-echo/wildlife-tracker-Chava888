class AnimalsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        animals = Animal.all
        render json: animals
    end
    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end
    def destroy
        animal = Animal.find(params[:id])
        animal.destroy
        render json: animal
    end
    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end
    def show
        animal = Animal.find(params[:id])
        render json: animal.as_json(include: :sightings)
    end
    def render_unprocessable_entity_response(exception)
        render json: {
          message: "Validation Failed",
          errors: ValidationErrorsSerializer.new(exception.record).serialize
        }, status: :unprocessable_entity
    end
    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end
end
