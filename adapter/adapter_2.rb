class Animal
  module Adapter #start Adapter
    module Dog
      def self.speak
        puts "woof!"
      end
    end

    module Cat
      def self.speak
        puts "meow!"
      end
    end
  end #end Adapter

  def speak
    self.adapter.speak
  end

  def adapter
    return @adapter if @adapter # if adapter previously defined

    self.adapter = :dog
    @adapter
  end

  def adapter=(adapter)
    @adapter = Animal::Adapter.const_get(adapter.to_s.capitalize)
  end
end

animal = Animal.new
animal.speak
animal.adapter = :cat
animal.speak
