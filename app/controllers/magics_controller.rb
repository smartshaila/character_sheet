class MagicsController < ApplicationController
  before_action :set_magic, only: [:show, :edit, :update, :destroy]

  # GET /magics
  # GET /magics.json
  def index
    @magics = Magic.all
  end

  # GET /magics/1
  # GET /magics/1.json
  def show
  end

  # GET /magics/new
  def new
    @magic = Magic.new
  end

  # GET /magics/1/edit
  def edit
  end

  # POST /magics
  # POST /magics.json
  def create
    @magic = Magic.new(magic_params)

    respond_to do |format|
      if @magic.save
        format.html { redirect_to @magic, notice: 'Magic was successfully created.' }
        format.json { render :show, status: :created, location: @magic }
      else
        format.html { render :new }
        format.json { render json: @magic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magics/1
  # PATCH/PUT /magics/1.json
  def update
    respond_to do |format|
      if @magic.update(magic_params)
        format.html { redirect_to @magic, notice: 'Magic was successfully updated.' }
        format.json { render :show, status: :ok, location: @magic }
      else
        format.html { render :edit }
        format.json { render json: @magic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magics/1
  # DELETE /magics/1.json
  def destroy
    @magic.destroy
    respond_to do |format|
      format.html { redirect_to magics_url, notice: 'Magic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magic
      @magic = Magic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magic_params
      params.require(:magic).permit(:name, :description, :item_id)
    end
end
