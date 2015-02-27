class CreateEleves < ActiveRecord::Migration
  def change
    create_table :eleves do |t|

      t.string :creation
      t.string :prenom
      t.string :datenaissance
      t.string :ville
      t.string :cp
      t.string :diplome
      t.string :situationpro
      t.string :institution
      t.string :logement
      t.string :allocataire
      t.string :bourse
    end
  end
end
