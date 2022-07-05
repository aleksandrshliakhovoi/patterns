# frozen_string_literal: true

class Admin; end

class Member; end

class Guest; end

class UserFactory
  def self.call(user_type)
    case user_type
    when 'admin'
      Admin.new
    when 'member'
      Member.new
    when 'guest'
      Guest.new
    else
      'Achtung! Schweinehunde!'
    end
  end
end

class Endpoint
  def initialize(params)
    @params = params
  end

  def call
    show_object
  end

  private

  def show_object
    puts user.inspect
  end

  def user
    UserFactory.call(@params[:user_type])
  end
end


endpoint = Endpoint.new({user_type: "member"}).call