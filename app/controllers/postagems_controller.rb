class PostagemController < ApplicationController
    before_action do
    @dialogo = Dialogo.find(params[:dialogo_id])
  end

  def index
    @postagems = @dialogo.postagems
    if @postagems.length > 10
      @over_ten = true
      @postagems = @postagems[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @postagems = @dialogo.messages
    end
    if @postagens.last
      if @postagens.last.usuario_id != Usuario.find(session[:user_id])
        @postagens.last.read = true;
      end
    end

    @postagem = @dialogo.postagems.new
  end

  def new
    @postagem = @dialogo.postagems.new
  end

  def create
    @postagem = @dialogo.postagems.new(postagem_params)
    if @postagem.save
      redirect_to conversation_postagems_path(@dialogo)
    end
  end

private
  def postagem_params
    params.require(:postagem).permit(:body, :usuario_id)
end
end
