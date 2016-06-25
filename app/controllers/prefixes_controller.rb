class PrefixesController < ApplicationController
  before_action :set_prefix, only: :show

  # GET /prefixes
  # GET /prefixes.json
  def index
    @prefixes = Prefix.all
  end

  # GET /prefixes/1
  # GET /prefixes/1.json
  def show
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
