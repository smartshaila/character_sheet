class CharacterFeature < ActiveRecord::Base
  belongs_to :character
  belongs_to :feature
end
