# Estrutura no Firebase

## Authentication
A autenticação está sendo efetuada pelo Firebase Auth, onde ao criar um usuário, já é criado um arquivo no Firestore com os dados do usuário criado.

## Database / Firestore
Foi criado duas coleções para o armazenamento de dados:

# Users
* Coleção para armazenar os dados dos usuários
* Os nomes dos documentos é o ID gerado pelo Authentication	 

```json
{
	"email": "[string]",
	"fullName": "[string]",
	"lastName": "[string]",
	"name": "[string]"
}
```

# Pets
* Coleção para armazenar os dados dos Pets
* Os nomes dos documentos é gerado pelo Firestore automaticamente

```json
{
	"petAge": "[Float]",
	"petcolor": "[string]",
	"petDescription": "[string]",
	"petDGender": "[string]",
	"petImages": 
		{ 
			"[string]" 
		},
	"petName": "[string]",
	"petTutorId": "[string]",
	"petTutorName": "[string]",
	"petType": "[string]",
	"petWeight": "[Float]",
}
```

## Storage
Utilizado para efetuar upload das imagens, o endereço das imagens são retornadas e salvas no Firestore