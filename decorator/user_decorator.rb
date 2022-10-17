require 'delegate'

class User
  def initialize(first_name:, last_name:, birthday:)
    @first_name = first_name
    @last_name = last_name
    @birthday = birthday
  end

  attr_accessor :first_name, :last_name, :birthday
end


class UserDecorator < SimpleDelegator
  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    # 60 * 60 * 24 * 365.25 is 31557600
    # 31557600 is one year in seconds
    ((Time.now - birthday) / 31557600).floor
  end
end

user = User.new(
  first_name: "SamSam",
  last_name: "Ni Hao",
  birthday: Time.new(1996, 6, 27, 6, 0, 0, "+03:00")
)

user_decorator = UserDecorator.new(user)

puts user_decorator.class
puts user_decorator.first_name
user_decorator.last_name
user_decorator.full_name
user_decorator.birthday
user_decorator.age
