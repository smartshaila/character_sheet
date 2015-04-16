class CharacterAbility < ActiveRecord::Base
  belongs_to :character
  belongs_to :ability
end
