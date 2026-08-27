class User < ApplicationRecord
  has_secure_password

  has_many :news

  enum :role, {
    Administrador: 0,
    Pastor: 1,
    Secretaria: 2,
    Tesouraria: 3
  }
end
