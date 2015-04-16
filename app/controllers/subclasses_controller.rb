class SubclassesController < ApplicationController
  before_action :set_subclass, only: [:show, :edit, :update, :destroy]

  # GET /subclasses
  # GET /subclasses.json
  def index
    @subclasses = Subclass.all
  end

  # GET /subclasses/1
  # GET /subclasses/1.json
  def show
  end

  # GET /subclasses/new
  def new
    @subclass = Subclass.new
  end

  # GET /subclasses/1/edit
  def edit
  end

  # POST /subclasses
  # POST /subclasses.json
  def create
    @subclass = Subclass.new(subclass_params)

    respond_to do |format|
      if @subclass.save
        format.html { redirect_to @subclass, notice: 'Subclass was successfully created.' }
        format.json { render :show, status: :created, location: @subclass }
      else
        format.html { render :new }
        format.json { render json: @subclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subclasses/1
  # PATCH/PUT /subclasses/1.json
  def update
    respond_to do |format|
      if @subclass.update(subclass_params)
        format.html { redirect_to @subclass, notice: 'Subclass was successfully updated.' }
        format.json { render :show, status: :ok, location: @subclass }
      else
        format.html { render :edit }
        format.json { render json: @subclass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subclasses/1
  # DELETE /subclasses/1.json
  def destroy
    @subclass.destroy
    respond_to do |format|
      format.html { redirect_to subclasses_url, notice: 'Subclass was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subclass
      @subclass = Subclass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subclass_params
      params.require(:subclass).permit(:adventuring_class_id, :name, :description, :min_level)
    end
end
