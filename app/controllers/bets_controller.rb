class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy, :inside_bet]

  # GET /bets
  # GET /bets.json
  def index
    @bets = Bet.all
  end

  # GET /bets/1
  # GET /bets/1.json
  def show
  end

  # GET /bets/new
  def new
    @bet = Bet.new
  end

  # GET /bets/1/edit
  def edit
  end

  # POST /bets
  # POST /bets.json
  def create
    @bet = Bet.new(bet_params)

    respond_to do |format|
      if @bet.save
        format.html { redirect_to @bet, notice: 'Bet was successfully created.' }
        format.json { render :show, status: :created, location: @bet }
      else
        format.html { render :new }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def nova
  	@bet = Bet.new
  end
  
  def inside_bet
    #render:inside_bet 
  end
  
  
  def bet_create
  	@bet = Bet.new(bet_params)
    @bet.usuario_id = session[:user_id]
    @bet.category = 'Personalizado'
    @bet.room_status = 1
    
    respond_to do |format|
      if @bet.save
        format.html { render:inside_bet }
        #format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render:nova }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def lista
    myBets
  end
  
  def myBets
    @bets = Bet.where(usuario_id:  session[:user_id])
  end
  

  # PATCH/PUT /bets/1
  # PATCH/PUT /bets/1.json
  def update
    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to @bet, notice: 'Bet was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet }
      else
        format.html { render :edit }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bets/1
  # DELETE /bets/1.json
  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url, notice: 'Bet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bet
      @bet = Bet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bet_params
      params.require(:bet).permit(:name, :description, :usuario_id, :url_photo, :category, :room_status, :room_type, :stake, :final_date, :final_answer, :answer_type)
    end
end
