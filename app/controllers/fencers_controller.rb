class FencersController < ApplicationController
  before_action :set_fencer, only: [:show, :edit, :update, :destroy]

  # GET /fencers
  # GET /fencers.json
  def index
    @fencers = Fencer.all
  end

  # GET /fencers/1
  # GET /fencers/1.json
  def show
  end

  # GET /fencers/new
  def new
    @fencer = Fencer.new
  end

  # GET /fencers/1/edit
  def edit
  end

  # POST /fencers
  # POST /fencers.json
  def create
    @fencer = Fencer.new(fencer_params)

    respond_to do |format|
      if @fencer.save
        format.html { redirect_to @fencer, notice: 'Fencer was successfully created.' }
        format.json { render :show, status: :created, location: @fencer }
      else
        format.html { render :new }
        format.json { render json: @fencer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fencers/1
  # PATCH/PUT /fencers/1.json
  def update
    respond_to do |format|
      if @fencer.update(fencer_params)
        format.html { redirect_to @fencer, notice: 'Fencer was successfully updated.' }
        format.json { render :show, status: :ok, location: @fencer }
      else
        format.html { render :edit }
        format.json { render json: @fencer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fencers/1
  # DELETE /fencers/1.json
  def destroy
    @fencer.destroy
    respond_to do |format|
      format.html { redirect_to fencers_url, notice: 'Fencer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fencer
      @fencer = Fencer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fencer_params
      params[:fencer]
    end
end
