class SpellDuration < ActiveRecord::Base
  belongs_to :spell
  belongs_to :time_increment
end
