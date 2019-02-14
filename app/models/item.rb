class Item < ApplicationRecord
  validates :item, presence: true, length: { maximum: 255 }
end
