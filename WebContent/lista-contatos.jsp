<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Contacts</title>
</head>
<body>
	
		<div class="text-center">
			<h1 class="display-4">Lista de contatos</h1>
	    </div>
	
		<c:if test="${empty contatos}">
			<div class="text-center">
				<hr>
				<h2>Nenhum contato cadastrado!</h2>
			</div>
		</c:if>
		
		<c:if test="${not empty contatos}">
			<div class="table-responsive">
				<table class="table">
						<tr>
							<th>Nome</th>
							<th>E-mail</th>
							<th>Endereco</th>
							<th>Telefone</th>
							<th></th>
						</tr>
						
						<c:forEach var="pessoa" items="${contatos}">
							<tr>
								<td>${pessoa.nome}</td>
								<td>${pessoa.email}</td>
								<td>${pessoa.endereco}</td>
								<td>${pessoa.telefone}</td>
								<td>
									<a href="#" onclick="saveContactId(${pessoa.id})" data-toggle="modal" data-target="#modalExemplo">Remover</a>
									<span> | </span>
									<a href="adiciona-contato.jsp?id=${pessoa.id}&nome=${pessoa.nome}&email=${pessoa.email}&endereco=${pessoa.endereco}&telefone=${pessoa.telefone}">Editar</a>
								</td>
							</tr>
						</c:forEach>
				</table>
			</div>
		</c:if>
		
	<div class="modal fade" id="modalExemplo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Alerta!</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
					 	<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<span>Você realmente deseja remover esse contato?</span>
				</div>
				<div class="modal-footer">
					 <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
					 <a href="#" onclick="removeContact()" class="btn btn-primary">Continuar</a>
				</div>
			</div>
		</div>
	</div>
		
	<script>
	
		var contact;
		
		function saveContactId(idContact) { 
			contact = idContact;
		}
		
		function removeContact() {
			window.location.href = "remove-usuario?id="+contact;
		}
		
	</script>

</body>
</html>