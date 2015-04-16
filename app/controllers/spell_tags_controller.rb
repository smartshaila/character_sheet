class SpellTagsController < ApplicationController
  before_action :set_spell_tag, only: [:show, :edit, :update, :destroy]

  # GET /spell_tags
  # GET /spell_tags.json
  def index
    @spell_tags = SpellTag.all
  end

  # GET /spell_tags/1
  # GET /spell_tags/1.json
  def show
  end

  # GET /spell_tags/new
  def new
    @spell_tag = SpellTag.new
  end

  # GET /spell_tags/1/edit
  def edit
  end

  # POST /spell_tags
  # POST /spell_tags.json
  def create
    @spell_tag = SpellTag.new(spell_tag_params)

    respond_to do |format|
      if @spell_tag.save
        format.html { redirect_to @spell_tag, notice: 'Spell tag was successfully created.' }
        format.json { render :show, status: :created, location: @spell_tag }
      else
        format.html { render :new }
        format.json { render json: @spell_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spell_tags/1
  # PATCH/PUT /spell_tags/1.json
  def update
    respond_to do |format|
      if @spell_tag.update(spell_tag_params)
        format.html { redirect_to @spell_tag, notice: 'Spell tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @spell_tag }
      else
        format.html { render :edit }
        format.json { render json: @spell_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spell_tags/1
  # DELETE /spell_tags/1.json
  def destroy
    @spell_tag.destroy
    respond_to do |format|
      format.html { redirect_to spell_tags_url, notice: 'Spell tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spell_tag
      @spell_tag = SpellTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spell_tag_params
      params.require(:spell_tag).permit(:spell_id, :tag_id)
    end
end
