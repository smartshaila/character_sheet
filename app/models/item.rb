class Item < ActiveRecord::Base
  belongs_to :item_type
  has_many :weapons, dependent: :destroy
  has_many :magics, dependent: :destroy
end
