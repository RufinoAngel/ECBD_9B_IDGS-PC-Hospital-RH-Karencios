# 💻 Source - Hospital API

![Backend](https://img.shields.io/badge/Módulo-Backend-blue?style=for-the-badge)
![API](https://img.shields.io/badge/Arquitectura-REST-green?style=for-the-badge)
![Estado](https://img.shields.io/badge/Código-Fuente-orange?style=for-the-badge)

Código fuente principal de la API REST del Sistema Hospitalario UDN-RH.

---

## 📝 Descripción General

La carpeta `source` contiene todos los componentes necesarios para el desarrollo, mantenimiento y evolución de la API del sistema hospitalario.

Aquí se implementa la lógica de negocio encargada de procesar solicitudes, administrar recursos hospitalarios, validar información, gestionar usuarios y establecer la comunicación con las diferentes bases de datos utilizadas por el sistema.

La arquitectura del proyecto está diseñada para ser modular, escalable y mantenible, permitiendo el crecimiento continuo de la plataforma.

---

## 📂 Estructura del Proyecto

```text
source
│
├── controllers
├── services
├── models
├── routes
├── middleware
├── config
└── utils
```

---

## ⚙️ Componentes del Sistema

### 📌 Controllers

Módulos encargados de recibir y procesar las solicitudes HTTP provenientes de clientes y aplicaciones externas.

**Funciones principales:**

* Procesamiento de peticiones
* Gestión de respuestas HTTP
* Validación inicial de datos
* Comunicación con servicios internos

---

### ⚡ Services

Contienen la lógica de negocio principal de la aplicación.

**Funciones principales:**

* Procesamiento de información
* Aplicación de reglas de negocio
* Integración con servicios externos
* Gestión de procesos internos

---

### 🗄️ Models

Definen las estructuras de datos utilizadas por el sistema.

**Funciones principales:**

* Representación de entidades
* Validación de atributos
* Relaciones entre modelos
* Manipulación de registros

---

### 🛣️ Routes

Definen los endpoints disponibles dentro de la API.

**Funciones principales:**

* Organización de rutas
* Asociación de controladores
* Gestión de recursos
* Versionado de servicios

---

### 🔐 Middleware

Funciones ejecutadas entre la solicitud y la respuesta.

**Responsabilidades:**

* Autenticación de usuarios
* Validación de tokens
* Control de acceso
* Manejo de errores
* Registro de eventos

---

### ⚙️ Config

Archivos de configuración global utilizados por la aplicación.

**Incluye:**

* Variables de entorno
* Configuración de bases de datos
* Configuración de puertos
* Parámetros de seguridad

---

### 🧰 Utils

Funciones auxiliares reutilizables en distintos módulos del sistema.

**Incluye:**

* Helpers
* Conversores
* Validadores
* Funciones de apoyo

---

## 🚀 Funcionalidades Principales

* Gestión de usuarios y autenticación
* Administración hospitalaria
* Gestión de historiales clínicos
* Validación y procesamiento de información
* Comunicación con bases de datos
* Integración con aplicaciones Web y Wearable
* Exposición de servicios REST
* Gestión segura de sesiones

---

## 🛠️ Tecnologías Utilizadas

### Backend

* Node.js
* Express.js
* JavaScript

### Seguridad

* JWT (JSON Web Token)
* Middleware de autenticación
* Control de acceso

### Bases de Datos

* MySQL
* MongoDB

### Comunicación

* REST API
* JSON
* HTTP/HTTPS

---

## 🔒 Seguridad

La API implementa diversos mecanismos para proteger la información del sistema:

* Autenticación mediante JWT
* Protección de rutas privadas
* Validación de entradas de usuario
* Control de acceso por roles
* Manejo seguro de sesiones
* Registro de eventos y errores

---

## 🎯 Objetivo General

Centralizar toda la lógica backend del sistema hospitalario mediante una arquitectura robusta, segura y escalable, capaz de proporcionar servicios confiables para las aplicaciones que conforman el ecosistema UDN-RH.

---

## 👥 Equipo de Desarrollo

| Integrante | Contacto | Rol | Observaciones |
| :--- | :--- | :--- | :---: |
| Angel de Jesus Rufino Mendoza | [@RufinoAngel](https://github.com/RufinoAngel) | Líder del Proyecto y Desarrollador | ✅ Aprobado |
| Karen Lizbeth Negrete Hernández | [@KarenNegrete06](https://github.com/KarenNegrete06) | Lider de Documentación | Sin Revisar ❎ |
| Abril Guzman Barrera | [@Abrilgb](https://github.com/Abrilgb) | Lider de Fronted | Aprobado ✅ |
| Esther Gonzalez Peralta | [@Esther-Gonzalez04](https://github.com/Esther-Gonzalez04) | Líder del Base de datos | Sin Revisar ❎ |
