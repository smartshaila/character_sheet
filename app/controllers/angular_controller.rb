class AngularController < ApplicationController

  def character
    @id = params[:id]
  end

  def character_data
    render :json => JSON.pretty_generate(JSON.parse(Character.find(params[:id]).to_json(include: {character_abilities: {include: :ability}, character_skills: {}, inventories: {include: [:item, :weapon, :magic]}})))
  end

  def items
    render :json => JSON.pretty_generate(JSON.parse(Item.all.to_json(include: [:item_type, :weapons, :magics])))
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

  def skills
    result = Skill.all.map{|skill| {
      id: skill.id,
      name: skill.name,
      ability: Ability.find(skill.ability_id),
      }
    }
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

  def build_inventory
    @character_id = params[:character_id]
    @character = Character.find(@character_id)
    @items = params[:items]

    unless @character.nil? or @items.empty?
      inventory_params = {
        character: @character,
        quantity: 1,
        is_private: false,
        is_equipped: false
      }
      @items.each{|item|
        inventory_params[:item_id] = item[:id]
        Inventory.create(inventory_params)
      }
      result = @character.inventories
      render :json => result.to_json(include: [:item, :weapon, :magic])
    else
      render :json => {errors: 'Character does not exist!'}
    end
  end
end