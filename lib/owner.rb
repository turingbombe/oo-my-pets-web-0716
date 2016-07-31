require 'pry'
class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []
  def initialize(name)
    @name = name
    @pets = {fishes:[],dogs:[],cats:[]}
    @species = "human"
    @@all << self
  end
#Class Methods
  def self.all
    @@all 
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.count
  end

#Instance methods  
  def say_species
    "I am a #{self.species}."
  end
  def buy_fish(fish_name)
    self.pets[:fishes] << Fish.new(fish_name)
  end

  def buy_cat(cat_name)
    self.pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
    self.pets[:dogs] << Dog.new(dog_name)
  end

  def walk_dogs
    self.pets[:dogs].map! {|dog| dog.mood= "happy"}
  end

  def play_with_cats
    self.pets[:cats].map! {|cat| cat.mood= "happy"}
  end

  def feed_fish
    self.pets[:fishes].map! {|fish| fish.mood= "happy"}
  end

  def sell_pets
    self.pets.each do |species, names|
      names.each {|pet| pet.mood = "nervous"}
      names.clear
    end

  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end  
end