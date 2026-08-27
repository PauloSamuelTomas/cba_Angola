source "https://rubygems.org"

gem "rails", "~> 8.1.3"

# Base de Dados
gem "sqlite3", ">= 2.1"

# Servidor Web
gem "puma", ">= 5.0"

gem "active_model_serializers"

# Autenticação
gem "bcrypt", "~> 3.1.7"
gem "jwt"

# CORS
gem "rack-cors"

# Paginação
gem "kaminari"

# Windows
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Rails 8
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Boot
gem "bootsnap", require: false

# Deploy
gem "kamal", require: false

# HTTP
gem "thruster", require: false

# Active Storage
gem "image_processing", "~> 2.0"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end
