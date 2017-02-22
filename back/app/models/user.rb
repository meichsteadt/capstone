require 'bcrypt'

class User < ApplicationRecord
  has_many :products
  include BCrypt
  validates :email, :password, :first_name, :last_name, presence: true
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
