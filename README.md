# BTG Funds

Aplicación móvil Flutter para la gestión de fondos de inversión (FPV/FIC) de BTG Pactual. Esta aplicación permite a los usuarios visualizar, gestionar y realizar seguimiento de sus inversiones de forma sencilla e intuitiva.

## 📋 Descripción del Proyecto

**BTG Funds** es una solución móvil diseñada para proporcionar a los clientes de BTG Pactual una experiencia fluida en la gestión de sus fondos de inversión. La aplicación ofrece:

- **Visualización de fondos**: Listado completo de fondos disponibles con detalles financieros
- **Transacciones**: Registro y seguimiento de operaciones de compra/venta
- **Interfaz intuitiva**: Diseño moderno y responsive para diferentes dispositivos

## 🎬 Demo

<img src="assets/videos/demo.gif" alt="BTG Funds Demo" width="700"/>

**Opciones disponibles:**
- 🔊 [Ver con audio en Drive](https://drive.google.com/file/d/1AX7SHt55CdJNqe0Pp8piXFuHUwBk12t3/view?usp=sharing)

## 🛠 Requisitos Previos

- **Flutter** 3.38.7 + ([Instalar](https://flutter.dev/docs/get-started/install))
- **Dart** (incluido con Flutter)
- **Git**, **Node.js 16+**, **npm**
- **Android Studio/SDK** (API 24+) o **Xcode 14.3+** (según plataforma destino)

## 📦 Instalación

```bash
# Clonar y entrar al directorio
git clone https://https://gitlab.com/frguerrerogo/btg_fund_manager
cd btg_fund_manager

# Instalar dependencias
flutter pub get

# Generar archivos (si modificaste modelos de datos)
flutter pub run build_runner build --delete-conflicting-outputs

flutter pub run build_runner watch
```

**Para el backend mock (opcional):**
```bash
npm install -g json-server
```

## 🚀 Ejecución

**Terminal 1 - Iniciar servidor mock:**
```bash
json-server --watch db.json --port 3000
```

**Terminal 2 - Ejecutar app:**
```bash
flutter run
```

> **Alternativa:** Presiona `F5` (launch.json configurado con BTGFunds • DEV)

## 🏗 Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── app/
│   ├── app.dart             # Configuración principal de la app
│   └── router/              # Definición de rutas (Go Router)
├── core/
│   ├── constants/           # Constantes globales
│   ├── di/                  # Inyección de dependencias
│   ├── extensions/          # Extensiones útiles (SnackBar, etc.)
│   ├── network/             # Configuración de HTTP (Dio)
│   ├── providers/           # Proveedores Riverpod globales
│   ├── shared/              # Widgets y utilidades compartidas
│   ├── theme/               # Colores, estilos y temas
│   └── widgets/             # Widgets reutilizables
└── features/
    ├── funds/               # Feature: Gestión de fondos
    ├── transaction/         # Feature: Transacciones
    └── user/                # Feature: Perfil de usuario

test/
├── features/                # Tests unitarios y de widgets
└── ...
```

## 🔧 Configuración

### Backend Mock (db.json)

El archivo `db.json` contiene los datos mock para desarrollo. Para modificar:

```json
{
  "funds": [...],
  "transactions": [...],
  "users": [...]
}
```

Inicia el servidor:

```bash
json-server --watch db.json --port 3000
```

### Variables de Entorno (si aplica)

Si necesitas configurar URLs de API, puedes crear un archivo `.env` en la raíz (requiere configuración adicional).

## 📚 Tecnologías Utilizadas

| Tech | Propósito |
|------|-----------|
| **Flutter 3.10.7** | Framework móvil |
| **Dart 3.x** | Lenguaje |
| **Riverpod 3.0.3** | State management |
| **Go Router 16.3.0** | Navegación |
| **Dio 5.4.3** | HTTP client |
| **Freezed / json_serializable** | Serialización de modelos |
| **json-server** | Backend mock |

## 🧪 Testing & Build

```bash
# Tests unitarios
flutter test

# Compilación
flutter build apk          # Android
flutter build appbundle    # Android (Play Store)
flutter build ios          # iOS
```

## 🪝 Git Hooks

Configurar **una sola vez**:
```bash
git config core.hooksPath githooks
```

- **Pre-commit**: Ejecuta `flutter analyze` y `flutter test` automáticamente
- **Commit-msg**: Valida formato (feat:, fix:, refactor:, etc.)

Saltarse si es necesario: `git commit --no-verify`
## 👤 Autor y Contacto

**Desarrollador**: Fabian Guerrero

Para preguntas o soporte, puedes contactarme en:

- **Email**: [frguerrerogo@gmail.com](frguerrerogo@gmail.com)
- **LinkedIn**: [frguerrerogo](https://www.linkedin.com/in/frguerrerogo/)

**Última actualización:** Marzo 23 de 2026
