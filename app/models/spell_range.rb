class SpellRange < ActiveRecord::Base
  belongs_to :spell
  belongs_to :range_type
end
