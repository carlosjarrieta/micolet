## Consideraciones generales
### Instalación
Clone el repositorio y ejecute:
- bundle install
- yarn install
- rails db:create
- rails db:migrate
- rails db:seed
	El seeder creará las categorias ["Moda Mujer", "Moda Hombre", "Moda infantil"]
	también creará dos usuarios: carlosj.arrieta@gmail.com pass: 123456 y user2@micolet.com 	con pass "123456"
	- El primer usuario tiene en su campo "language" el string "es", esto determinará el idioma de la página.
	el segundo usuario no contiene el dato language, por lo que tomará el idioma del navegador
	


## Modulos
###EmailValidate
https://www.abstractapi.com/email-verification-validation-api 
Este módulo consume el api (abstractapi) comprobando la validez del email y el quality_score

## ApplicationRecord
En la clase ApplicationRecord se creo el método **validate_email_api** para validar el email, este método es heredado por los modelos, sólo debe validarse en los modelos que incluyan un campo email.

## Prototipo
El prototipo utiliza la gem Devise para la autenticación del usuario. Cuando un usuario ya está autenticado, si este quiere suscribirse a los newsletter, el email del usuario aparecerá en el input para ingresar el email.