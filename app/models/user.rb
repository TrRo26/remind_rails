class User < ApplicationRecord
  has_many :lists
  has_many :items, {through: :lists}
end
