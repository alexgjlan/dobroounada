class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  # GET /invites
  # GET /invites.json
  def index
    @invites = Invite.where(id_user: session[:user_id])
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
  end
  
  # Campo de Busca
  def usuarios_srch
    @selected = Usuario.all
    @bets = Bet.find(params[:id_bet])
    @search = params[:search]
    
    if params[:search]
      @selected = Usuario.search(params[:search])
      
      if params[:search]==""
        @selected = nil
      end
    else
      @selected = nil
    end
    
    respond_to do |format|
      format.js
    end
  end

  # GET /invites/new
  def new
    @invite = Invite.new
    @usuarios = nil
  end
  
  # GET /invites/1/novo
  def novo
    @usuarios = nil
  end
  
  #GET /invites/inserir
  def inserir
    convite = Invite.new
    
    convite.id_bet = params[:id_bet]
    convite.id_user = params[:id_user]
    
    convite.save
    
    #Dar reload nos contatos
    redirect_to usuarios_srch_path(:search => params[:search], :id_bet => params[:id_bet])
    
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites
  # POST /invites.json
  def create
    @invite = Invite.new(invite_params)

    respond_to do |format|
      if @invite.save
        format.html { redirect_to @invite, notice: 'Invite was successfully created.' }
        format.json { render :show, status: :created, location: @invite }
      else
        format.html { render :new }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invites_url, notice: 'Invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_params
      params.require(:invite).permit(:id_bet, :id_user)
    end
end