class AdventuringClass < ActiveRecord::Base
  has_many :class_proficiencies, dependent: :destroy
  has_many :subclasses, dependent: :destroy
end
