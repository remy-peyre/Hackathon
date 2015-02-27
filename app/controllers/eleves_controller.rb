class ElevesController < ApplicationController

  def index
    @prout = Eleve.tabash
    if Eleve.count < 50
      @prout.each { |eleve| Eleve.create(eleve) }
    else
      redirect_to show_path
    end
  end

  def show
    @moyennedage = Eleve.moyenage
    @eleves = Eleve.all
    @markers = @eleves.map do |eleve| 
      {:latlng => [eleve.latitude , eleve.longitude]} if eleve.latitude && eleve.longitude
    end.compact
    @bourse = Eleve.bourse
    @inscription_par_date = Eleve.inscription_par_date
    @compteur = Eleve.count
  end


end
