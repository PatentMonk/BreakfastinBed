class Order < ApplicationRecord
  belongs_to :purchaser
  belongs_to :payment
end
