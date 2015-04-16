class ArmorsController < ApplicationController
  before_action :set_armor, only: [:show, :edit, :update, :destroy]

  # GET /armors
  # GET /armors.json
  def index
    @armors = Armor.all
  end

  # GET /armors/1
  # GET /armors/1.json
  def show
  end

  # GET /armors/new
  def new
    @armor = Armor.new
  end

  # GET /armors/1/edit
  def edit
  end

  # POST /armors
  # POST /armors.json
  def create
    @armor = Armor.new(armor_params)

    respond_to do |format|
      if @armor.save
        format.html { redirect_to @armor, notice: 'Armor was successfully created.' }
        format.json { render :show, status: :created, location: @armor }
      else
        format.html { render :new }
        format.json { render json: @armor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armors/1
  # PATCH/PUT /armors/1.json
  def update
    respond_to do |format|
      if @armor.update(armor_params)
        format.html { redirect_to @armor, notice: 'Armor was successfully updated.' }
        format.json { render :show, status: :ok, location: @armor }
      else
        format.html { render :edit }
        format.json { render json: @armor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armors/1
  # DELETE /armors/1.json
  def destroy
    @armor.destroy
    respond_to do |format|
      format.html { redirect_to armors_url, notice: 'Armor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_armor
      @armor = Armor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def armor_params
      params.require(:armor).permit(:item_id, :base_ac, :max_ability)
    end
end
