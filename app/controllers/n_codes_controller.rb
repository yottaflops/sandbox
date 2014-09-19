class NCodesController < ApplicationController
  require 'federal_register'

  before_action :set_n_code, only: [:show, :edit, :update, :destroy]

  # GET /n_codes
  # GET /n_codes.json
  def index
    @n_codes = NCode.all
  end

  # GET /n_codes/1
  # GET /n_codes/1.json
  def show
  end

  # GET /n_codes/new
  def new
    @n_code = NCode.new
  end

  # GET /n_codes/1/edit
  def edit
  end

  # POST /n_codes
  # POST /n_codes.json
  def create
    @n_code = NCode.new(n_code_params)
    article = FederalRegister::Article.search(:conditions => {:term => @n_code.term})
    results = article.results
    toys = Array.new
    results.each do |result|
      toy = Toy.new
      toy.document_number = result.document_number
      toy.html_url = result.html_url
      toy.type = result.type
      toy.title = result.title
      toy.save

      toys << toy
    end

    render json: toys, status: 201
  end

  # PATCH/PUT /n_codes/1
  # PATCH/PUT /n_codes/1.json
  def update
    respond_to do |format|
      if @n_code.update(n_code_params)
        format.html { redirect_to @n_code, notice: 'N code was successfully updated.' }
        format.json { render :show, status: :ok, location: @n_code }
      else
        format.html { render :edit }
        format.json { render json: @n_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /n_codes/1
  # DELETE /n_codes/1.json
  def destroy
    @n_code.destroy
    respond_to do |format|
      format.html { redirect_to n_codes_url, notice: 'N code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_n_code
      @n_code = NCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def n_code_params
      params.require(:n_code).permit(:term)
    end
end
