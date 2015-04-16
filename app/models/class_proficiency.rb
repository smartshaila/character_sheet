class ClassProficiency < ActiveRecord::Base
  belongs_to :adventuring_class
  belongs_to :ability
end
