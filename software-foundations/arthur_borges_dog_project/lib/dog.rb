class Dog
  
  def initialize(name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  def name
    @name
  end

  def breed
    @breed
  end

  def age
    @age
  end

  def bark
    (@age > 3 ? @bark.upcase : @bark.downcase)
  end

  def favorite_foods
    @favorite_foods
  end

  def name=(name)
    @name = name
  end

  def breed=(breed)
    @breed = breed
  end

  def age=(age)
    @age = age
  end

  def bark=(bark)
    @bark = bark
  end

  def favorite_foods=(favorite_foods)
    @favorite_foods = favorite_foods
  end

  def favorite_food?(string)
    @favorite_foods.any? {|food| food.downcase == string.downcase}
  end
end