class AdventuringClassesController < ApplicationController
  before_action :set_adventuring_class, only: [:show, :edit, :update, :destroy]

  # GET /adventuring_classes
  # GET /adventuring_classes.json
  def index
    @adventuring_classes = AdventuringClass.all
  end

  # GET /adventuring_classes/1
  # GET /adventuring_classes/1.json
  def show
  end

  # GET /adventuring_classes/new
  def new
    @adventuring_class = AdventuringClass.new
  end

  # GET /adventuring_classes/1/edit
  def edit
  end

  # POST /adventuring_classes
  # POST /adventuring_classes.json
  def create
    @adventuring_class = AdventuringClass.new(adventuring_class_params)

    respond_to do |format|
      if @adventuring_class.save
        format.html { redirect_to @adventuring_class, notice: 'Adventuring class was successfully created.' }
        format.json { render :show, status: :created, location: @adventuring_class }
      else
        format.html { render :new }
        format.json { render json: @adventuring_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adventuring_classes/1
  # PATCH/PUT /adventuring_classes/1.json
  def update
    respond_to do |format|
      if @adventuring_class.update(adventuring_class_params)
        format.html { redirect_to @adventuring_class, notice: 'Adventuring class was successfully updated.' }
        format.json { render :show, status: :ok, location: @adventuring_class }
      else
        format.html { render :edit }
        format.json { render json: @adventuring_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adventuring_classes/1
  # DELETE /adventuring_classes/1.json
  def destroy
    @adventuring_class.destroy
    respond_to do |format|
      format.html { redirect_to adventuring_classes_url, notice: 'Adventuring class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adventuring_class
      @adventuring_class = AdventuringClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adventuring_class_params
      params.require(:adventuring_class).permit(:name, :hit_die)
    end
end
