class ClassSpell < ActiveRecord::Base
  belongs_to :adventuring_class
  belongs_to :subclass
  belongs_to :spell
end
