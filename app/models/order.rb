class Order < ApplicationRecord
  belongs_to :user
  belongs_to :stock
  has_many :tickets
end
