require "base64"
require "openssl"
require "json"
require "byebug"

@cipher = 'aes-128-gcm'
puts "Paste in your master.key file"
raw_key = gets.chomp
@key = [raw_key].pack('H*')
puts "Key detected:\n#{@key}\nTotal size: #{raw_key.length}"
puts "Now paste your encrypted.enc file:"
credentials = gets.chomp
puts "Credentials detected:\n#{credentials}\nTotal size: #{credentials.length}"

def new_cipher
  OpenSSL::Cipher.new(@cipher)
end

def decrypt(value)
  cipher = new_cipher
  encrypted_data, iv, auth_tag = value.split("--".freeze).map { |v| ::Base64.strict_decode64(v) }

  byebug
  cipher.decrypt
  cipher.key = @key
  cipher.iv  = iv
  cipher.auth_tag = auth_tag
  cipher.auth_data = ""

  decrypted_data = cipher.update(encrypted_data)
  decrypted_data << cipher.final
  return decrypted_data
end

decrypted = decrypt(credentials)
puts "Decrypted data:\n"
puts decrypted