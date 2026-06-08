# 🚀 Proyecto SixSeven - Despliegue TIS

Este repositorio contiene el código fuente y la orquestación mediante contenedores del sistema SixSeven. La arquitectura consta de un Frontend (React/Vite) servido por Nginx, un Backend (Node.js/Express) y una Base de Datos (PostgreSQL).

## 📋 Requisitos Previos
* Docker Engine (v20+)
* Docker Compose (v2+)
* Los puertos `80`, `3000` y `5433` deben estar libres en el host.

## 🛠️ Instrucciones de Despliegue

1. **Clonar el repositorio:**
```bash
git clone [URL_DE_TU_REPOSITORIO]
cd [NOMBRE_DE_LA_CARPETA]
```

2. **Configuración de Variables de Entorno:**
   Hemos provisto un archivo `.env.example` en la raíz para referencia. 
   **Nota:** Se ha enviado un archivo `.env` funcional por correo electrónico a `adm.computo.umss@gmail.com` con las credenciales activas de los servicios de IA y SMTP. Por favor, coloque ese archivo `.env` en la raíz del proyecto.

3. **Ejecutar el sistema:**
   Levante todos los servicios en segundo plano y fuerce la construcción de las imágenes ejecutando:
```bash
sudo docker-compose up -d --build
```

## 📦 Notas Adicionales sobre la Base de Datos
No es necesario ejecutar migraciones manuales. El contenedor de PostgreSQL leerá automáticamente los archivos alojados en `./database/` e inicializará el esquema (`01-schema.sql`) y poblará los catálogos base (`02-seed.sql`) durante su primer arranque.
