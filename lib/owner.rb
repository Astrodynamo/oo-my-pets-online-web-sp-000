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
    self.cats << new_cat
  end
  
  def buy_dog (name)
    new_dog = Dog.new(name, self)
    self.dogs << new_dog
  end
  
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    self.dogs.each do |dog| 
      dog.mood = "nervous" 
      dog.owner = nil
    end
    self.cats.each do |cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    end
    self.dogs.clear
    self.cats.clear
  end
  
  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
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
