Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '1391396417552364', 'c255e7483b33426740326ce036210146', :client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}, :scope => "email"
	
    OmniAuth.config.on_failure = Proc.new do |env|
      #this will invoke the omniauth_failure action in SessionsController.
      "SessionsController".constantize.action(:failure).call(env)
    end  
end