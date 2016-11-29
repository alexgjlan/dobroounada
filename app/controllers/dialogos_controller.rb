class DialogosController < ApplicationController
  
  def index
    @usuarios = Usuario.all
    @dialogos = Dialogo.all
  end

  def create
    if Dialogo.between(params[:sender_id],params[:recipient_id]).present?
      @dialogo = Dialogo.between(params[:sender_id], params[:recipient_id]).first
    else
      @dialogo = Dialogo.create!(dialogo_params)
    end
    redirect_to conversation_postagems_path(@dialogo)
  end

private
  def dialogo_params
    params.permit(:sender_id, :recipient_id)
  end
end
