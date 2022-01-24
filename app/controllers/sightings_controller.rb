class SightingsController < ApplicationController
    def create
        animal = Animal.find(params[:animal_id])
        sighting = animal.sightings.create(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end
    def update
        animal = Animal.find(params[:animal_id])
        sighting = animal.sightings.find(params[:id])
        sighting.update(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end
    def destroy
        animal = Animal.find(params[:animal_id])
        sighting = animal.sightings.find(params[:id])
        sighting.destroy
        render json: sighting
    end
    def index
        sightings = Sighting.where(date: params[:start_date]..params[:end_date])
        render json: sightings
    end
    private
    #not sure how index is affected? Start date and end date.
    def sighting_params
        params.require(:sighting).permit(:date, :latitude, :longitude, :start_date, :end_date)
    end
end
