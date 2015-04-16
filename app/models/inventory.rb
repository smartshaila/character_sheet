class Inventory < ActiveRecord::Base
  belongs_to :character
  belongs_to :item
  belongs_to :weapon
  belongs_to :magic
end
