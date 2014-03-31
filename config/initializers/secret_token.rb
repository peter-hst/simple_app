# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SimpleApp::Application.config.secret_key_base = 'd73b837c15bc98778e7c2d91703fa02a1e72e496f46cd77468f5b82deeb9e2f2ef6dfffb90b41a5d054f0dae89a869ca149f62a44c905255eed74fcddbb91cd3'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

SimpleApp::Application.config.secret_key_base = secure_token
