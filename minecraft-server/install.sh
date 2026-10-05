#!/usr/bin/env bash
# Instala Docker y arranca el servidor de Minecraft en una VM Ubuntu/Debian recién creada.
# Uso:  bash install.sh
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v docker >/dev/null 2>&1; then
  echo ">> Instalando Docker..."
  curl -fsSL https://get.docker.com | sudo sh
  sudo usermod -aG docker "$USER" || true
fi

if [ ! -f .env ]; then
  cp .env.example .env
  echo ">> Se creó .env a partir de .env.example."
  echo "   Edítalo (nano .env) con tu usuario y una contraseña RCON, y vuelve a ejecutar este script."
  exit 0
fi

# Abre los puertos en el firewall local si ufw está activo
if command -v ufw >/dev/null 2>&1 && sudo ufw status | grep -q "Status: active"; then
  sudo ufw allow 25565/tcp
  sudo ufw allow 19132/udp
fi

echo ">> Arrancando el servidor..."
sudo docker compose up -d

IP=$(curl -fsS https://api.ipify.org || echo "<IP-de-tu-VM>")
echo
echo ">> Listo. Conéctate desde Minecraft a:  ${IP}:25565"
echo "   Ver logs:      sudo docker compose logs -f minecraft"
echo "   Consola:       sudo docker exec -it minecraft rcon-cli"
