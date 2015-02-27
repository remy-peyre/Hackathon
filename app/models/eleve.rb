class Eleve < ActiveRecord::Base
geocoded_by :ville   # can also be an IP address
after_validation :geocode          # auto-fetch coordinates

  def self.tabash
    tabash = SmarterCSV.process("candidatures-2015.csv")
  end

  def self.moyenage
    agealleleve = []
    Eleve.all.each do |eleve|
    agealleleve << 2015 - (eleve.datenaissance.split("/").last.to_i)
    end
    (agealleleve.reduce(:+)) / (Eleve.count)
  end

  def self.bourse
    tabouibourse = []
    tabouibourse = Eleve.all.map {|eleve| eleve.bourse.match(/Oui/)}
    tabouibourse.compact!
    (((tabouibourse.count.to_f) / (Eleve.count.to_f)) * 100).to_i
  end

  def mois_creation
    date_creation.split('/')[0]
  end

  def date_creation
    creation.split(' ')[0]
  end

  def self.filtre_dates
    Eleve.all.map {|eleve| eleve.date_creation}
  end

  def self.dates
    Eleve.filtre_dates.uniq
  end

  def self.inscription_par_date
    Eleve.dates.map do |date|
      inscrits = Eleve.filtre_dates.count{|d| d == date}
      {date => inscrits}
    end
  end



  def self.mois
    Eleve.all.map {|eleve| eleve.mois_creation}.uniq
  end


  # def self.inscription_par_mois
  #   self.class.mois.map do |mois| 
  #     self.class.count {[]}
  #   tabmoisinscrip = self.class.dateinscript.map{|date| mois_creation}
  #   count = Hash.new(0)
  #   tabmoisinscrip.each {|mois| count[mois] += 1}
  #   count
  # end
end