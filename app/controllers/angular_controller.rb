class AngularController < ApplicationController
  def index
  end

  def classes2
    result = Hash[AdventuringClass.all.map{|ac|
      [
          ac.id,
          {
              name: ac.name,
              proficiencies: ac.class_proficiencies.map{|cp|
                cp.ability.id
              }
          }
      ]
    }]
    render :json => result.to_json
  end

  def classes
    result = AdventuringClass.all.map{|ac|
          {
              id: ac.id,
              name: ac.name,
              proficiencies: ac.class_proficiencies.map{|cp|
                cp.ability.id
              }
          }
    }
    render :json => result.to_json
  end
end