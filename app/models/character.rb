class Character < ActiveRecord::Base
  belongs_to :adventuring_class
  belongs_to :player
  belongs_to :campaign
  has_many :character_abilities, dependent: :destroy
  has_many :character_skills, dependent: :destroy
  has_many :inventories, dependent: :destroy

  validates :name, presence: true
  validates :player, presence: true
  validates :campaign, presence: true
  validates :adventuring_class, presence: true
  validates :current_xp, presence: true

  def level_progression
    LevelProgression.where("min_xp <= ?", self.current_xp).max_by(&:level)
  end
end
