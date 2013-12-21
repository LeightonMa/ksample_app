# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# KsampleApp::Application.config.secret_key_base = 'd7c170a6e40325d09d6f1ba170d3a900c2d0d90d261ff9f9398454c1343dbb62c7c37a0aaf6dee16cf379a5b05c7bc5e2af91a07d6b96f8b710313107e74e717'
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use the existing token.
		File.read(token_file).chomp
	else
		# Generaet a new token and store it in token_file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

KsampleApp::Application.config.secret_key_base = secure_token 