# Van Dogh

# Español

## Descripción general

La aplicación Van Dogh es una aplicación móvil basada en Flutter diseñada para proporcionar información detallada sobre diferentes razas de perros mediante la integración con The Dog API. Este proyecto demuestra una implementación bien estructurada de Flutter, con un enfoque en la arquitectura limpia, la gestión del estado utilizando Provider y las mejores prácticas en el desarrollo móvil.

## Requisitos vs Code

| Ítem                                                     | ¿Marcado? |
| -------------------------------------------------------- | --------- |
| Uso de traducciones (EN/ES)                              | ⭐        |
| Uso de SQLite para favoritos                             | ⭐        |
| Uso de Provider como Gestor de estados                   | ✅        |
| Uso de TheDogAPI para consultar razas                    | ✅        |
| Uso de API-KEY `live_T360G12h...`                        | ✅        |
| Mostrar versión de la aplicación en SplashScreen         | ✅        |
| Pantallas Splash, Home, Favoritos, Detalle               | ✅        |
| Uso de Google Fonts                                      | ✅        |
| Uso de la última versión de Flutter                      | ✅        |
| Cumplimiento de la información en la pantalla de detalle | ✅        |
| Cumplimiento de la información en la card de Razas       | ✅        |

## Oportunidades de mejora

- **Uso de la API de favoritos:** El proyecto está utilizando SQLite para los favoritos debido a que el endpoint ha fallado al usar `sub_id`.
- **Optimización de las imágenes:** Las imágenes se están cargando a su tamaño completo, lo que podría optimizarse.

## Características

- **Navegar por Razas de Perros:** Obtener y mostrar una lista de razas de perros desde The Dog API.
- **Detalles de la Raza:** Navegar a una pantalla dedicada para cada raza, mostrando detalles adicionales como la esperanza de vida, el temperamento y el grupo de la raza.
- **Gestión de Favoritos:** Agregar y gestionar tus razas de perros favoritas, utilizando almacenamiento local a través de SQLite.
- **Funcionalidad de Búsqueda:** Buscar razas dinámicamente, minimizando las llamadas al backend para mejorar el rendimiento.
- **Soporte Offline:** Persistir las razas favoritas localmente para acceso sin conexión.
- **Interfaz Moderna:** Diseño limpio y fácil de usar implementado con los widgets de Flutter y Material Design.
- **Tema Oscuro y Claro:** La aplicación tiene un tema oscuro y claro, que se puede cambiar en la configuración.

---

## Aspectos Técnicos

### Arquitectura

**Arquitectura Limpia:** Separación de preocupaciones con capas distintas:

- **Capa de Infraestructura:** Maneja la integración con la API y el almacenamiento local de datos.
- **Capa de Dominio:** Contiene la lógica de negocio y las entidades principales.
- **Capa de Presentación:** Administra los componentes de la interfaz de usuario y el estado usando Provider.

### Librerías Clave

- **Gestión del Estado:** [Provider](https://pub.dev/packages/provider) para una gestión eficiente del estado.
- **Solicitudes HTTP:** [Dio](https://pub.dev/packages/dio) para la comunicación con la API.
- **Almacenamiento Local:** [Sqflite](https://pub.dev/packages/sqflite) para persistir las razas favoritas.
- **Enrutamiento:** [GoRouter](https://pub.dev/packages/go_router) para una navegación dinámica y declarativa.

### Funcionalidades Clave

1. **Obtener Razas:**
   - Integración con The Dog API para obtener una lista paginada de razas.
   - Manejo adecuado de errores y estados de carga.
2. **Búsqueda:**
   - Filtrado local de razas para búsquedas rápidas y eficientes.
   - Las llamadas al backend están limitadas para optimizar el rendimiento.
3. **Favoritos:**
   - Agregar o quitar razas de una lista de favoritos.
   - Persistir los favoritos localmente usando SQLite.
4. **Pantalla de Detalles:**
   - Muestra información extendida sobre la raza seleccionada, incluyendo su imagen, temperamento y esperanza de vida.

---

## Instalación

### Requisitos previos

- Flutter SDK (>=3.0.0)
- Android Studio o Xcode para ejecutar la aplicación en emuladores o dispositivos. (El desarrollo se realizó en Linux)

### Pasos

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/SnakyDH/van-dogh.git
   cd van_dog
   ```

2. Instalar dependencias:
   ```bash
   flutter pub get
   ```
3. Lanzar el app:
   ```bash
   flutter run
   ```

---

## Capturas de pantalla

1. **Pantalla de inicio**
   Muestra una lista de razas de perros con una imagen, nombre y grupo de raza.

2. **Funcionalidad de búsqueda**
   La barra de búsqueda permite a los usuarios filtrar razas dinámicamente.

3. **Pantalla de detalles de la raza**
   Muestra información detallada sobre una raza seleccionada, incluyendo su imagen, esperanza de vida y temperamento.

4. **Pantalla de favoritos**
   Lista de razas marcadas como favoritas por el usuario, con soporte offline.

---

## Mejoras futuras

- **Autenticación de usuario:** Agregar cuentas de usuario para sincronizar favoritos entre dispositivos.
- **Manejo mejorado de errores:** Mostrar mensajes de error amigables para el usuario en caso de fallas de la API.
- **Pruebas unitarias:** Agregar más cobertura para las capas de dominio y presentación.

---

## Por qué este proyecto?

Este proyecto destaca mi capacidad para:

- Construir y gestionar una aplicación Flutter siguiendo las mejores prácticas.
- Integrar APIs externas y manejar datos asíncronos.
- Implementar arquitectura limpia para código escalable y mantenible.
- Utilizar bibliotecas modernas de Flutter para proporcionar una experiencia de usuario fluida.

---

## Configuración:

Algunos comandos utilizados en la creación de la aplicación fueron:

### Native Splash:

Generar la configuración de la pantalla de bienvenida:

```sh
dart run flutter_native_splash:create --path=native_splash.yaml
```

# English

## Overview

The Van Dogh App is a Flutter-based mobile application designed to provide detailed information about different dog breeds by integrating with The Dog API. This project demonstrates a well-structured implementation of Flutter with a focus on clean architecture, state management using Provider, and best practices in mobile development.

## Requirements vs Code

| Item                                             | Checked? |
| ------------------------------------------------ | -------- |
| Use of Provider as State Manager                 | ✅       |
| Use of TheDogAPI to query breeds                 | ✅       |
| Use of API-KEY `live_T360G12h...`                | ✅       |
| Display app version on SplashScreen              | ✅       |
| Splash, Home, Favorites, Detail screens          | ✅       |
| Use of Google Fonts                              | ✅       |
| Use of the latest version of Flutter             | ✅       |
| Compliance with information on the detail screen | ✅       |
| Compliance with information on the Breeds card   | ✅       |

## Opportunities for improvement

- **Use of the api favorites:** The project is using SQLite for the favorites because the endpoint have failed using `sub_id`.
- **Optimization of the images:** The images are being loaded in full size, which can be optimized.

## Features

- **Browse Dog Breeds:** Fetch and display a list of dog breeds from The Dog API.
- **Breed Details:** Navigate to a dedicated screen for each breed, showcasing additional details like life span, temperament, and breed group.
- **Favorites Management:** Add and manage your favorite dog breeds, leveraging local storage via SQLite.
- **Search Functionality:** Search breeds dynamically, minimizing backend calls to improve performance.
- **Offline Support:** Persist favorite breeds locally for offline access.
- **Modern UI:** Clean and user-friendly design implemented with Flutter widgets and Material Design.

- **Dark and light Theme:** The application has a dark and light theme, which can be changed in the settings.

---

## Technical Highlights

### Architecture

- **Clean Architecture:** Separation of concerns with distinct layers:
  - **Infrastructure Layer:** Handles API integration and local data storage.
  - **Domain Layer:** Contains core business logic and entities.
  - **Presentation Layer:** Manages UI components and state using Provider.

### Key Libraries

- **State Management:** [Provider](https://pub.dev/packages/provider) for efficient state handling.
- **HTTP Requests:** [Dio](https://pub.dev/packages/dio) for API communication.
- **Local Storage:** [Sqflite](https://pub.dev/packages/sqflite) for persisting favorite breeds.
- **Routing:** [GoRouter](https://pub.dev/packages/go_router) for dynamic and declarative navigation.

### Key Functionalities

1. **Fetching Breeds:**
   - Integration with The Dog API to fetch a paginated list of breeds.
   - Error handling and loading states are managed gracefully.
2. **Search:**
   - Local filtering of breeds for fast and efficient searches.
   - Backend calls are limited to optimize performance.
3. **Favorites:**
   - Add or remove breeds from a favorites list.
   - Persist favorites locally using SQLite.
4. **Details Screen:**
   - Displays extended information about the selected breed, including its image, temperament, and life span.

---

## Installation

### Prerequisites

- Flutter SDK (>=3.0.0)
- Android Studio or Xcode for running the app on emulators or devices. (The Development was made in Linux)

### Steps

1. Clone the repository:

   ```bash
   git clone https://github.com/SnakyDH/van-dogh.git
   cd van_dog
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

---

## Screenshots

1. **Home Screen**
   Displays a list of dog breeds with an image, name, and breed group.

2. **Search Functionality**
   Search bar allows users to filter breeds dynamically.

3. **Breed Details Screen**
   Shows detailed information about a selected breed, including its image, life span, and temperament.

4. **Favorites Screen**
   List of breeds marked as favorites by the user, with offline support.

---

## Future Improvements

- **User Authentication:** Add user accounts to sync favorites across devices.
- **Improved Error Handling:** Show user-friendly error messages for API failures.
- **Unit Testing:** Add more coverage for the domain and presentation layers.

---

## Why This Project?

This project highlights my ability to:

- Build and manage a Flutter application following best practices.
- Integrate external APIs and handle asynchronous data.
- Implement clean architecture for scalable and maintainable code.
- Use modern Flutter libraries to provide a seamless user experience.

---

## Configuration:

some commands used in the creation of the application were:

### Native Splash:

Generate the Splash Screen configuration:

```sh
dart run flutter_native_splash:create --path=native_splash.yaml
```

### Launcher Icons:

Generate the launcher icons:

```sh
dart run flutter_launcher_icons:generate -f flutter_launcher_icons.yaml
```
