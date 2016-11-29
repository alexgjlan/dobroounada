class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
    
    if params[:search]
      @usuarios = Usuario.search(params[:search])
    else
      @usuarios = Usuario.all.order('created_at ASC')
    end
  end
  
  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end
  
  # POST /usuarios/login
  def login
	
  	@usuario = Usuario.find_by(email: usuario_params[:email], provider: "email")
  	
  	if @usuario == nil
  		redirect_to controller: 'welcome', action: 'index', :notice => "Falha ao logar"
  	else
  		if @usuario.access_token == usuario_params[:access_token]
  			session[:user_id] = @usuario.id
  			redirect_to controller: 'welcome', action: 'painel', :notice => "Bem vindo"
  		else
  			redirect_to controller: 'welcome', action: 'index', :notice => "Falha ao logar"
  		end
  	end
  end
  
  # GET /usuarios/cadastro
  def cadastro
  	@usuario = Usuario.new
  end
  
  # POST /usuarios/cadastro_create
  def cadastro_create
  	@usuario = Usuario.new(usuario_params)
  	@usuario.provider = "email"
  	@usuario.status = true
  	@usuario.user_type = "2"
  	@usuario.data_ingresso = Time.now
  	
    respond_to do |format|
      if @usuario.save
        session[:user_id] = @usuario.id
        format.html { redirect_to controller: 'welcome', action: 'painel', notice: 'Usuario was successfully created.' }
        #format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :cadastro }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:name, :email, :access_token, :uid, :photo_url, :provider, :status, :reason, :user_type, :data_ingresso)
    end
end
