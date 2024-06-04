# QR-Login-in-Multiple-Devices
En el siguiente proyecto podrás generar un código QR que te permitirá hacer login desde otro dispositivo y e iniciar sesión en los dos dispositivos simultaneamente, mediante firebase.
# Antes de ejecutar
* Obtener las librerías instaladas en el proyecto utilizando el comando 'flutter pub get'.
* Habilitar Firebasestore.
* Verificar que tiene el archivo json de Firebase en tu carpeta de Android y iOS.
* Verificar los permisos del dispositivo.
# Como funciona
Al ejecutar la aplicación 'qr_generator', se generará un código QR que tendrá como información un código uuid el cual será almacenado en la colección de firebase que se indique en el proyecto, este proyecto se mantendrá escuchando la colección hasta validar que su estatus cambie.

Cuando se ejecute el proyecto 'qr_lector' se obtendrá el código uuid y se actualizará la colección de postman y su estado cambiará lo cual será escuchado en la app que genera el QR, una vez cambie de estado en ambos dispositivos podrás iniciar sesión o redirigir a la pantalla que desees.

