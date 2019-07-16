class Owner
  attr_accessor :cats, :dogs
  attr_reader :name, :species
  @@all = []
  
  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
    @cats = []
    @dogs = []
  end
  
  def say_species
    return "I am a #{@species}."
  end
  
  def buy_cat (name)
    new_cat = Cat.new(name, self)
    @cats << new_cat
  end
  
  def buy_dog (name)
    new_dog = Dog.new(name, self)
    @dogs << new_dog
  end
  
  def walk_dogs
    @dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    @cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    @dogs.each do |dog| 
      dog.mood = "nervous" 
      dog.owner = nil
    end
    @cats.each do |cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    end
    @dogs.clear
    @cats.clear
  end
  
  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cats(s)."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
end
