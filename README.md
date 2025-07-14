# BTG Fund Manager - Prueba Técnica Flutter

**BTG Fund Manager** es una aplicación móvil desarrollada en Flutter como parte de una prueba técnica. Su objetivo es simular la gestión de fondos de inversión para usuarios de BTG, permitiéndoles consultar fondos disponibles, suscribirse o cancelar su participación, y visualizar su historial de transacciones de forma clara, ágil y efectiva.

La aplicación está diseñada para ofrecer una experiencia de usuario fluida, con una interfaz intuitiva, diseño responsivo y validaciones en tiempo real. Entre sus funcionalidades principales se incluyen la validación de montos mínimos, actualización automática del saldo, notificaciones configurables (por SMS o email), y manejo adecuado de errores y estados de carga.

Para simular el backend, se utiliza [`json-server`](https://github.com/typicode/json-server) con datos locales en formato JSON, lo que permite realizar peticiones HTTP como si se tratara de una API REST real.

## 🚀 Características principales

- Visualización de la lista de fondos disponibles.
- Suscripción y cancelación de participación en fondos.
- Validación de saldo y montos mínimos requeridos.
- Actualización del saldo disponible.
- Historial de transacciones detallado.
- Selección de método de notificación: email o SMS.
- Feedback visual, manejo de errores y loading states.
- UI responsiva y experiencia de usuario optimizada.

## 🔥 Tecnologías Usadas

- **Flutter**: Framework principal.
- **Riverpod**: Gestión de estado.
- **Kiwi**: Inyección de dependencias.
- **GoRoute**: Navegación.
- **HTTP**: Cliente HTTP para APIs.
- **json-server**: API REST simulada.
- **Json Annotation**: Serialización/deserialización de JSON.
- **Intl**: Internacionalización y formatos.
- **Flutter Test**: Pruebas unitarias y de integración.
- **Arquitectura modular**: Separación del proyecto en paquetes independientes (features, core, shared).
- **Arquitectura limpia (Clean Architecture)**: separación de capas: presentación, dominio y datos.
- **Flutter Test**: Pruebas unitarias y de integración.

## 🚀 Instalación y Configuración

### Requisitos previos

- **Flutter 3.29.0**
- **Dart 3.7.0**
- Dependencias instaladas con `flutter pub get`.

### Instalación

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/frguerrerogo/btg_fund_manager.git
   cd weather
   ```

2. Instalar dependencias:
   ```bash
   flutter pub get
   ```
3. Ejecutar la aplicación:
    Para correr la aplicación en modo desarrollo, simplemente ejecuta:
    ```bash
    flutter run
    ```
## 📂 Estructura del Código

Este proyecto sigue una arquitectura modular basada en Clean Architecture, separando las capas de presentación, dominio y datos, lo que facilita la escalabilidad y el mantenimiento.

- core/ → Configuraciones generales, inyección de dependencias, temas y utilidades globales.
- data/ → Implementación de fuentes de datos (APIs, realm) y repositorios concretos.
- domain/ → Definición de entidades, repositorios abstractos y casos de uso.
- presentation/ → UI, lógica de estado con Cubit/Bloc, pantallas y widgets reutilizables.

Esta estructura permite un flujo limpio y desacoplado, facilitando la gestión de cambios y nuevas funcionalidades.

```
lib/
├── core/                # Constantes, helpers, utilidades globales
├── data/                # Servicios, modelos remotos, repositorios
├── domain/              # Casos de uso y abstracciones
├── presentation/        # Vistas y widgets compartidos
│   ├── funds/           # Lógica y UI relacionada con los fondos
│   ├── transactions/    # Historial y detalles de transacciones
│   ├── profile/         # Preferencias del usuario y notificaciones
```

## 👤 Autor y Contacto

**Desarrollador**: Fabian Guerrero

Para preguntas o soporte, puedes contactarme en:

- **Email**: [frguerrerogo@gmail.com](frguerrerogo@gmail.com)
- **LinkedIn**: [frguerrerogo](https://www.linkedin.com/in/frguerrerogo/)