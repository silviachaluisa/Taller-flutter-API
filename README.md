# POKEMON API


## Descripción del Proyecto:
El objetivo es generar una aplicación que me permita buscar y mostrar Pokémons pero con todas sus características, incluida su foto.
## Instalación y Configuración:
- Utilizar http para hacer solicitudes a las APIs
- Agregar en el archivo pubspec.yaml
`dependencies:
  http: ^0.14.0`
- Ejecutar los siguientes comandos <br>
`flutter pub get`: Para que las dependencias esten actualizadas <br>
`flutter run`: Para  <br>
`flutter build apk --release`: Indica a Flutter que genere la APK para Android. `--release`: Construye la APK en modo release, optimizada para producción. Sin esto, la APK se generará en modo debug, lo que no es ideal para distribuirla a usuarios.
> [!NOTE]
> **¿Donde se genera la APK?** <br>
  Se encontrará dentro de la siguiente ruta: `<tu_proyecto>/build/app/outputs/flutter-apk/app-release.apk`

## Capturas de Pantalla:
![image](https://github.com/user-attachments/assets/f87e4c8b-7900-4048-b1f0-9019050f65be)
![image](https://github.com/user-attachments/assets/cc37b008-f8bc-43e4-a119-5c2ec1ffdb03)

## APIS utilizadas:
Detalle del uso de:
- Pokémon API (https://pokeapi.co)
- La segunda API seleccionada (por ejemplo, OpenWeatherMap).
  
##  Error de la APK al ejecutarse en el teléfono
> [!CAUTION]
> Probablemente un error relacionado con el entorno de la aplicación en modo release puede presentarse.
> Esto podría ocurrir debido a alguna restricción de red, problemas con los permisos de Internet en el archivo de configuración, o una configuración de seguridad de la API en modo release.

> [!TIP]
> **Pasos para solucionar el problema**
- Asegurar los permisos de Internet en AndroidManifest.xml que se encuentra en la siguiente ruta: `android/app/src/main/AndroidManifest.xml` <br>
- Agregar lo siguiente justo antes de la etiqueta `<application>`: `<uses-permission android:name="android.permission.INTERNET" />`<br>
Puede verse algo asi:<br>
![{B6CFEE37-E1A7-4875-8F18-84DDFDCCC249}](https://github.com/user-attachments/assets/7c5f5f4e-b47e-4af3-92af-96e84b745ff8)

- Probar las llamadas a la API
Es posible que la llamada a la API falle en modo release debido a restricciones SSL o algo relacionado con la seguridad de las solicitudes.<br>
Para asegurarte de que el servidor sea accesible correctamente, puedes agregar una validación de la URL en el código. <br>
Por ejemplo: `final url = Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=100");`
En el código donde consumes la API (ApiService), verifica la conexión:
![{14B17B10-92B6-40CD-B7CB-74BF67F6790F}](https://github.com/user-attachments/assets/a89f4bd1-2654-4212-ac85-494cd18d0bad)
De esta forma puedes asegurarte de ver el error en la consola para entender mejor por qué falla en el modo release.
Ejecuta nuevamente estos comandos: <br>
`flutter clean`
`flutter pub get`
`flutter build apk --release`
## Pasos para generar una clave de firma de la apk:<br>

- Abrir una terminal y ejecuta el siguiente comando para crear un archivo keystore<br>
`keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias`<br>
- En mi caso: `keytool -genkey -v -keystore silvia-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias silvia-key-alias`<br>
- Durante la ejecución, pedirá completar los siguientes datos:

Contraseña del keystore: (Elige una contraseña segura y anótala, la necesitarás más adelante).<br>
Nombre y apellidos: Silvia Chaluisa<br>
Nombre de la organización: Puedes poner "Personal" o el nombre de tu proyecto.<br>
Nombre de la unidad organizativa: Desarrollo de Software<br>
Ciudad o localidad: Tu ciudad<br>
Estado o provincia: Tu provincia<br>
País (código de 2 letras): Código ISO de tu país (por ejemplo, EC para Ecuador).<br>
- Una vez completes estos pasos, se generará el archivo silvia-release-key.jks en el directorio donde se ejecuto el comando.<br>
- Generar la apk con el siguiente comando: `flutter build apk --release`<br>
## Pasos para la publicación de la apk:<br>
- En este caso la plataforma seleecionada para la publicación de la apk es:<br>

![image](https://github.com/user-attachments/assets/0dd19fdc-3e48-483d-be45-8cd03d05d1dd)

Si no se tiene una cuenta se debe crearla:<br>
![image](https://github.com/user-attachments/assets/b0ed8d5c-8c91-49ac-9ac0-7cb58a0e2cee)

Subir la apk creada:<br>
 ![image](https://github.com/user-attachments/assets/2e798dd5-bd3a-430c-ac06-a13d4e555867)
 ![image](https://github.com/user-attachments/assets/8b5f6322-8e1b-4d9c-b773-1fb1b6e87971)
 ![image](https://github.com/user-attachments/assets/49039854-6e1c-4a8e-a7d9-1c7513b35140)

 - Paso 1 <br>
 Se ingresan los detalles solicitados en los campos
 ![image](https://github.com/user-attachments/assets/5a5a8965-8f92-4199-8b3a-a2d67989d733)
- Paso 2<br>
Completar el cuestionario para poder completar el paso 
![{800053D4-9FE5-427C-BFBF-506312680A9B}](https://github.com/user-attachments/assets/dfb3f31b-9c3b-405f-9970-a5f4f5c15042)

- Paso 3<br>
Ingresar las imagenes de acorde a las resoluciones solicitadas
![image](https://github.com/user-attachments/assets/7f2520ad-7399-4059-9396-95c539c3462e)
- Paso 4<br>
Se envia la solicitud para la publicación de la apk
![image](https://github.com/user-attachments/assets/c22918a4-f52e-4ac1-970c-57504d4781f4)
- Estado para la APP
![image](https://github.com/user-attachments/assets/d2622509-97b9-4a36-9abc-aa3c50977767)





