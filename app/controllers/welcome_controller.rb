class WelcomeController < ApplicationController

  def index
    @usuario = Usuario.new
   
  end
  
  def painel

    if session[:user_id] == nil
			redirect_to action: 'index', :notice => "Por favor efetue o login"
    end
    else 
      @usuarios = Usuario.where(id: session[:user_id])
    
  end
  

end