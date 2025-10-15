# 🪄 Grimorio

**Grimorio** es una aplicación web para la gestión y venta de **cartas Magic: The Gathering**, incluyendo productos sueltos, sets especiales y expansiones.  
El sistema está desarrollado con **ASP.NET Core 8 (API REST)** y un **frontend en Angular 14**, siguiendo una arquitectura **por capas limpia y modular**.

---

## 🚀 Tecnologías principales

### Backend
- **ASP.NET Core 8** (C#)
- **Entity Framework Core** con enfoque **Database First**
- **SQL Server Express (SQLEXPRESS)** como base de datos
- **JWT (JSON Web Tokens)** para autenticación y autorización
- **Automapper** (para mapeo entre entidades y DTOs)
- **Dependency Injection (IoC)** nativa de .NET
- **xUnit / MSTest** para pruebas unitarias

### Frontend
- **Angular 14**
- **TypeScript**
- **Bootstrap / TailwindCSS**
- **JWT Auth Interceptor**
- **Consumo de la API REST de Grimorio**

---

## 🧱 Arquitectura del proyecto

Grimorio sigue una **arquitectura en capas**, separando las responsabilidades en diferentes proyectos dentro de la solución.  
Esta estructura facilita la mantenibilidad, la escalabilidad y el testeo de los componentes.

```
📦 Grimorio
│
├── 1 - Presentacion/
│   └── Grimorio.API
│
├── 2 - Aplicacion/
│   ├── Grimorio.BLL        → Lógica de negocio (servicios, casos de uso)
│   └── Grimorio.DTO        → Objetos de transferencia de datos
│
├── 3 - Dominio/
│   └── Grimorio.Model      → Entidades del dominio (tablas y modelos base)
│
├── 4 - Infraestructura/
│   ├── Grimorio.DAL        → Acceso a datos, repositorios, EF Core (Database First)
│   ├── Grimorio.IOC        → Configuración de inyección de dependencias
│   └── Grimorio.Utility    → Utilidades, helpers, extensiones comunes
│
└── 5 - Pruebas/
    └── Grimorio.Test       → Proyecto de pruebas unitarias
```

---

## 🧩 Base de datos y Entity Framework Core

El proyecto utiliza **Entity Framework Core** en modo **Database First**, conectado a una instancia local de **SQL Server Express (SQLEXPRESS)**.  
El modelo se genera automáticamente desde la base de datos mediante el siguiente comando:

```bash
dotnet ef dbcontext scaffold "Server=.\SQLEXPRESS;Database=GrimorioDB;Trusted_Connection=True;TrustServerCertificate=True" Microsoft.EntityFrameworkCore.SqlServer -o Models -c GrimorioContext -f
```

El contexto generado se encuentra dentro del proyecto **Grimorio.DAL**.

---

## 🔐 Seguridad

El sistema utiliza **JWT (JSON Web Tokens)** para gestionar la autenticación y autorización de usuarios.  
Incluye:
- Registro e inicio de sesión de usuarios.
- Asignación de **roles** (Administrador, Cliente, Invitado).
- Validación de tokens en cada endpoint protegido.

---

## ⚙️ Ejecución del proyecto

### 1️⃣ Backend (.NET)
```bash
cd Grimorio.API
dotnet restore
dotnet run
```
El API se ejecutará por defecto en `https://localhost:5001` o `http://localhost:5000`.

### 2️⃣ Frontend (Angular)
```bash
cd client
npm install
ng serve
```
El frontend estará disponible en `http://localhost:4200`.

---

## 🧩 Estructura general de comunicación

```
Angular (frontend)
      ↓ (HTTP / JSON)
Grimorio.API (ASP.NET Core)
      ↓
Grimorio.BLL → Grimorio.DAL → SQL Server Express (Database First)
```

---

## ⚙️ Variables de entorno requeridas

El proyecto requiere algunas variables configuradas en el archivo `appsettings.json` o como variables de entorno del sistema:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=.\\SQLEXPRESS;Database=GrimorioDB;Trusted_Connection=True;TrustServerCertificate=True"
  },
  "Jwt": {
    "Key": "ClaveSecretaSuperSegura123!",
    "Issuer": "GrimorioAPI",
    "Audience": "GrimorioUsers"
  }
}
```

---

## 🧪 Pruebas

El proyecto incluye un módulo de pruebas (`Grimorio.Test`) donde se validan:
- Servicios de negocio (BLL)
- Repositorios de datos (DAL)
- Autenticación y generación de tokens JWT

Ejecutar pruebas:
```bash
dotnet test
```

---

## 🧑‍💻 Autores

Proyecto desarrollado por el equipo de **Grimorio Devs**.  
Diseñado con enfoque modular y escalable para futuros añadidos como:
- Gestión de inventario
- Carrito de compras
- Pasarela de pago
- Panel de administración avanzado

---

> 🪶 *“La magia no está en las cartas… sino en el código que las hace cobrar vida.”*
