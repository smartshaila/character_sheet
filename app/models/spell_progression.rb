class SpellProgression < ActiveRecord::Base
  belongs_to :adventuring_class
  belongs_to :subclass
  belongs_to :level_progression
end
