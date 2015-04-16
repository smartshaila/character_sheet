class SpellTag < ActiveRecord::Base
  belongs_to :spell
  belongs_to :tag
end
