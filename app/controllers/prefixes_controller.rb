class PrefixesController < ApplicationController
  before_action :set_prefix, only: [:show, :edit, :update, :destroy]

  # GET /prefixes
  # GET /prefixes.json
  def index
    @prefixes = Prefix.all
  end

  # GET /prefixes/1
  # GET /prefixes/1.json
  def show
  end

  # GET /prefixes/new
  def new
    @prefix = Prefix.new
  end

  # GET /prefixes/1/edit
  def edit
  end

  # POST /prefixes
  # POST /prefixes.json
  def create
    @prefix = Prefix.new(prefix_params)

    respond_to do |format|
      if @prefix.save
        format.html { redirect_to @prefix, notice: 'Prefix was successfully created.' }
        format.json { render :show, status: :created, location: @prefix }
      else
        format.html { render :new }
        format.json { render json: @prefix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prefixes/1
  # PATCH/PUT /prefixes/1.json
  def update
    respond_to do |format|
      if @prefix.update(prefix_params)
        format.html { redirect_to @prefix, notice: 'Prefix was successfully updated.' }
        format.json { render :show, status: :ok, location: @prefix }
      else
        format.html { render :edit }
        format.json { render json: @prefix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prefixes/1
  # DELETE /prefixes/1.json
  def destroy
    @prefix.destroy
    respond_to do |format|
      format.html { redirect_to prefixes_url, notice: 'Prefix was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_prefix
    @prefix = Prefix.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def prefix_params
    params.fetch(:prefix, {})
  end
end
