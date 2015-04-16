class AdventuringClass < ActiveRecord::Base
  has_many :class_proficiencies, dependent: :destroy
end
