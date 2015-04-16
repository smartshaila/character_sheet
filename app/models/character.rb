class Character < ActiveRecord::Base
  belongs_to :adventuring_class
  belongs_to :player
  belongs_to :campaign
  has_many :character_abilities, dependent: :destroy
  has_many :character_skills, dependent: :destroy

  def level_progression
    LevelProgression.where("min_xp <= ?", self.current_xp).max_by(&:level)
  end
end
