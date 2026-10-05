# Servidor de Minecraft en la nube

Servidor **Java Edition** (Paper) listo para desplegar con Docker en cualquier VM en la nube,
con copias de seguridad automáticas cada 6 horas y soporte opcional para jugadores de **Bedrock**.

## 1. Crea una máquina virtual

Cualquier proveedor sirve. Recomendaciones:

| Proveedor | Plan sugerido | Coste aprox. |
|---|---|---|
| Oracle Cloud (Always Free) | Ampere A1, 4 OCPU / 24 GB RAM | Gratis |
| Hetzner | CAX11 / CX22 (4 GB RAM) | ~4 €/mes |
| DigitalOcean / AWS Lightsail | 4 GB RAM | ~20-24 $/mes |

- Sistema operativo: **Ubuntu 22.04 o 24.04**.
- Mínimo **2 GB de RAM** (4 GB recomendado para 5-10 jugadores).
- En el firewall / grupo de seguridad del proveedor abre:
  - `25565/TCP` (Java)
  - `19132/UDP` (solo si usas Bedrock)

## 2. Instala y arranca

Conéctate por SSH a la VM y ejecuta:

```bash
git clone https://github.com/izajelimite-stack/Referee-Please.git
cd Referee-Please/minecraft-server
bash install.sh      # instala Docker y crea .env
nano .env            # pon tu usuario (OPS / WHITELIST) y cambia RCON_PASSWORD
bash install.sh      # arranca el servidor
```

El script mostrará la IP a la que conectarte: `IP:25565`.

## 3. Uso diario

```bash
sudo docker compose logs -f minecraft      # ver logs
sudo docker exec -it minecraft rcon-cli    # consola (op, whitelist add, etc.)
sudo docker compose restart minecraft      # reiniciar
sudo docker compose down                   # apagar
sudo docker compose pull && sudo docker compose up -d   # actualizar
```

Añadir un jugador a la lista blanca desde la consola: `whitelist add NombreJugador`.

## 4. Copias de seguridad

Se guardan en `backups/` cada 6 horas y se borran las de más de 7 días.
Para restaurar: apaga el servidor, sustituye la carpeta `data/world*` por el contenido del backup y vuelve a arrancar.

## 5. Jugadores de Bedrock (móvil / consola)

Descomenta `MODRINTH_PROJECTS=geyser,floodgate` en `.env` y ejecuta `sudo docker compose up -d`.
Los jugadores de Bedrock se conectan a `IP` con puerto `19132`.

## Ajustes

Toda la configuración está en `.env` (versión, memoria, dificultad, modo de juego, etc.).
Las variables disponibles están documentadas en
[itzg/docker-minecraft-server](https://docker-minecraft-server.readthedocs.io/).
