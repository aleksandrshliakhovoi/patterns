require 'base64'
require 'aes'
require 'pry'

class TextMessage
  attr_accessor :encryptor
  attr_reader :original_message
  
  def initialize(original_message, encryptor)
    @original_message = original_message
    @encryptor = encryptor
  end

  def encrypt_me
    encryptor.encrypt(self)
  end

  def decrypt_me
    encryptor.decrypt(self)
  end
end

class SimpleEncryptor
  ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  ENCODING = 'MOhqm0PnycUZeLdK8YvDCgNfb7FJtiHT52BrxoAkas9RWlXpEujSGI64VzQ31w'

  def encrypt(context)
    context.original_message.tr(ALPHABET, ENCODING)
  end
  
  def decrypt(context)
    context.original_message.tr(ENCODING, ALPHABET)
  end
end

class Base64Encryptor
  def encrypt(context)
    Base64.encode64(context.original_message)
  end

  def decrypt(context)
    Base64.decode64(context.original_message)
  end
end

class AESEncryptor
  KEY = 'dsfi434n534df0v0bn23324dfgdfgdf4353454'

  def encrypt(context)
    AES.encrypt(context.original_message, KEY)
  end
  
  def decrypt(context)
    AES.decrypt(context.original_message, KEY)
  end
end


word = "word"
message = TextMessage.new(word, SimpleEncryptor.new)
enc_msg_1 = message.encrypt_me
puts enc_msg_1
puts TextMessage.new(enc_msg_1, SimpleEncryptor.new).decrypt_me

message.encryptor = Base64Encryptor.new
enc_msg_2 =  message.encrypt_me
puts enc_msg_2
puts TextMessage.new(enc_msg_2, Base64Encryptor.new).decrypt_me

message.encryptor = AESEncryptor.new
enc_msg_3 =  message.encrypt_me
puts enc_msg_3
puts TextMessage.new(enc_msg_3, AESEncryptor.new).decrypt_me
