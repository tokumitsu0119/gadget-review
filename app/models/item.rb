class Item < ApplicationRecord
  validates :item, presence: true, length: { maximum: 255 }
  validates :content, presence: true
end
