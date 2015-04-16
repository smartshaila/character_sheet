class Weapon < ActiveRecord::Base
  belongs_to :damage_type
  belongs_to :item
  belongs_to :ability
end
