# GitHubApp React Native Example.

## Instalación React Native

La descripcion y documentación acerca de React Native la puedes encontrar en su sitio web: **https://facebook.github.io/react-native/docs/getting-started.html#content**

Antes de instalar React Native, necesitamos instalar unas dependencias para que funcione correctamente.

Primero debemos instalar **Homebrew** Si es que no lo tenemos instalado.

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”
```

Posteriormente instalar las dependencias **Watchman**  y  **Flow**

```
brew install watchman
```

```
brew install flow
```

Instalar NODEJS desde su pagina oficial

https://nodejs.org/en/

Para finalizar instalar React-Native

```
sudo npm install react-native-cli -g
```

## Uso

Desde el terminal accedemos a la carpeta del proyecto e instalamos las dependencias.

```
npm install
```

## Test (iOS)

Abrir el archivo de XCODE y compilar.

```
/ios/FirstProject.xcodeproj
```

## Test (Android)

Desde el terminal accedemos a la carpeta del proyecto y corremos el siguiente comando.
Se recomienda tener instalado el emulador Genymotion, lo puedes descargar desde aqui.
https://www.genymotion.com/#!/download

```
react-native run-android
```