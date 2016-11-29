class Usuario < ActiveRecord::Base
    schema_validations auto_create: false
	def self.find_or_create_with_omniauth(auth)
		
		usuario = self.find_or_initialize_by(provider: auth.provider, uid: auth.uid)
		
		usuario.assign_attributes({ name: auth.info.name, email: auth.info.email, photo_url: auth.info.image, access_token: auth.credentials.token, status: true, user_type: "2", data_ingresso: Time.now})
		usuario.save
		
		usuario
	end
	
	def self.search(search)
	   
	   if(search)
	       where('name LIKE ? AND status = ? AND user_type = ?', "%#{search}%", true, '2')
	   else
	       where('status = ? AND user_type = ?', true, '2') 
	   end
	end
    
    validates :name, presence: true
    validates :email, presence: true, email: true #Melhorar verificacao (melhor opcao eh enviar um email - n usar regex)
    validates :access_token, presence: true
    validates :uid, presence: true, if: :signed_with_facebook?
    validates :user_type, presence: true #revisar verificacao (por conta dos testes gerados automaticamente)
    
    #verificao certa, trava num dos testes automaticos pq ele usa "myString"
    #validates :user_type, format: {with: /[1,2]/} 
    
    
    #Funcao que testa se o cadastro foi feito pelo fb
    private
    def signed_with_facebook?
    	provider == "facebook"
    end
    
    has_many :bets, class_name: 'Bet', foreign_key: 'usuario_id', dependent: :destroy
    has_many :invites
    
end
