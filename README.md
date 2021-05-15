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
### EmailValidate
https://www.abstractapi.com/email-verification-validation-api 
Este módulo consume el api (abstractapi) comprobando la validez del email y el quality_score

## ApplicationRecord
En la clase ApplicationRecord se creo el método **validate_email_api** para validar el email, este método es heredado por los modelos, sólo debe validarse en los modelos que incluyan un campo email.

## Prototipo
El prototipo utiliza la gem Devise para la autenticación del usuario. Cuando un usuario ya está autenticado, si este quiere suscribirse a los newsletter, el email del usuario aparecerá en el input para recoger el email, si es un visitante no autenticado, igualmente aparece el formulario para suscribirse a las newsletter, pero se aprovechan los datos y se crea una cuenta de usuario. 
	- La lógica que sigue sería informar al visitante para que active su cuenta.

# Bonos no calificables en la prueba

## Bootstrap 4
Se utilizó una plantilla free bootstap 4, las imágenes y textos son propios de la plantilla. El copy right es de colorlib.

## Devise
El fronted está preparado en su forma más básica para hacer login, cambiar la contraseña, recuperar la contraseña.

## Sidekiq
Para el procesamiento de colas y trabajos en background.
Se creó un jobs (SubscriptionJob) para el envío de los emails al momento de la suscripción.

## Traducciones
Se hace uso de I18n para las traducciones

### Idiomas
	- ES
	- EN
	- DE 
