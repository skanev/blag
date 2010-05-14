# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blag_session',
  :secret      => '675dae818f62447dda90c6040d4f197d2476c68f6ab3da51a5d05f1abd39b3c274f4cf00fdbe0f9cd966be46b0b8f5559afe5af5e12b220b042c521a05afe8cb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
