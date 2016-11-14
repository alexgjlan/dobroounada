# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

root = exports ? this

root.verificacaoLogin = () ->
linkAtual = window.location.href
indicacaoFalhaLogin = linkAtual.indexOf "notice=Falha+ao+logar", 0
textoExibixao = '<div class="alert"><span class="closebtn" onclick="this.parentElement.style.display=' + "'none'" + ';">&times;</span><strong>Erro de acesso!</strong> Login e/ou senha incorretos</div>'
if indicacaoFalhaLogin >= 0
	document.write(textoExibixao)
return