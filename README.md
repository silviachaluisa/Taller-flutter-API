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

**Pasos para solucionar el problema**
- Asegurar los permisos de Internet en AndroidManifest.xml que se encuentra en la siguiente ruta: `android/app/src/main/AndroidManifest.xml` <br>
- Agrega lo siguiente justo antes de la etiqueta `<application>`: `<uses-permission android:name="android.permission.INTERNET" />`<br>
Puede verse algo asi:
![{B6CFEE37-E1A7-4875-8F18-84DDFDCCC249}](https://github.com/user-attachments/assets/7c5f5f4e-b47e-4af3-92af-96e84b745ff8)
