class Payment < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :credit_card, optional: true
end
