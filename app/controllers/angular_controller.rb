class AngularController < ApplicationController

  def character
    @id = params[:id]
  end

  def character_data
    render :json => Character.find(params[:id]).to_json(include: {character_abilities: {include: :ability}})
  end

  def classes
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

  def levels
    result = LevelProgression.all.map{|lp|
      {
          level: lp.level,
          proficiency: lp.proficiency,
          min_xp: lp.min_xp
      }
    }
    render :json => result.to_json
  end

  def urls
    result = Hash[Ability.all.map{|ability|
      [
        ability.name,
        view_context.image_path("#{ability.name.downcase}.png")
      ]
    }]
    render :json => result.to_json
  end

end