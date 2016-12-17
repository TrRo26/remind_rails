class User < ApplicationRecord
  validates :username, true, uniqueness: true

  has_many :lists


end
