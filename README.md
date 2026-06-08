# 🚀 Proyecto SixSeven - Despliegue TIS

Este repositorio contiene el código fuente y la orquestación mediante contenedores del sistema SixSeven. La arquitectura consta de un Frontend (React/Vite) servido por Nginx, un Backend (Node.js/Express) y una Base de Datos (PostgreSQL).

## 📋 Requisitos Previos
* Docker Engine (v20+)
* Docker Compose (v2+)
* Los puertos `80`, `3000` y `5433` deben estar libres en el host.

## 🛠️ Instrucciones de Despliegue

1. **Clonar el repositorio:**
```bash
git clone https://github.com/gonchi2332/six_seven
cd six_seven
```

2. **Configuración de Variables de Entorno:**
   Hemos provisto un archivo `.env.example` en la raíz para referencia. 
   **Nota:** Se ha enviado un archivo `.env` funcional por correo electrónico a quien corresponda con las credenciales activas de los servicios de IA y SMTP. Por favor, coloque ese archivo `.env` en la raíz del proyecto o copie y pegue en el `.env.example` y después renómbrelo.

3. **Ejecutar el sistema:**
   Levante todos los servicios en segundo plano y fuerce la construcción de las imágenes ejecutando:
```bash
sudo docker-compose up -d --build
```

## 📦 Notas Adicionales sobre la Base de Datos
No es necesario ejecutar migraciones manuales. El contenedor de PostgreSQL leerá automáticamente los archivos alojados en `./database/` e inicializará el esquema (`01-schema.sql`) y poblará los catálogos base (`02-seed.sql`) durante su primer arranque.

## 🌐 Acceso a la Aplicación
Una vez que los contenedores reporten el estado "Started", los servicios estarán disponibles localmente en las siguientes direcciones:
* **Frontend (Interfaz de Usuario):** http://localhost (o http://127.0.0.1). Servido estáticamente por Nginx en el puerto 80.
* **Backend (API RESTful):** http://localhost:3000. Expuesto directamente por Node.js/Express para recibir peticiones.
