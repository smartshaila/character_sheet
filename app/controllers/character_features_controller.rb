class CharacterFeaturesController < ApplicationController
  before_action :set_character_feature, only: [:show, :edit, :update, :destroy]

  # GET /character_features
  # GET /character_features.json
  def index
    @character_features = CharacterFeature.all
  end

  # GET /character_features/1
  # GET /character_features/1.json
  def show
  end

  # GET /character_features/new
  def new
    @character_feature = CharacterFeature.new
  end

  # GET /character_features/1/edit
  def edit
  end

  # POST /character_features
  # POST /character_features.json
  def create
    @character_feature = CharacterFeature.new(character_feature_params)

    respond_to do |format|
      if @character_feature.save
        format.html { redirect_to @character_feature, notice: 'Character feature was successfully created.' }
        format.json { render :show, status: :created, location: @character_feature }
      else
        format.html { render :new }
        format.json { render json: @character_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_features/1
  # PATCH/PUT /character_features/1.json
  def update
    respond_to do |format|
      if @character_feature.update(character_feature_params)
        format.html { redirect_to @character_feature, notice: 'Character feature was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_feature }
      else
        format.html { render :edit }
        format.json { render json: @character_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_features/1
  # DELETE /character_features/1.json
  def destroy
    @character_feature.destroy
    respond_to do |format|
      format.html { redirect_to character_features_url, notice: 'Character feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_feature
      @character_feature = CharacterFeature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_feature_params
      params.require(:character_feature).permit(:character_id, :feature_id)
    end
end
