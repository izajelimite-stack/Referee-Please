# Referee, Please — Documento de diseño (v0.1)

> Un juego de arbitraje inspirado en *Papers, Please*. Eres árbitro de fútbol en una categoría
> modesta. Cada jugada es un "documento" que tienes que revisar con reglas que cambian cada
> jornada, con poco tiempo, con la grada encima y con gente que intenta comprarte.

## 1. La idea en una frase
Ves una jugada una sola vez, decides qué pitar y vives con las consecuencias; el VAR te deja
mirar mejor, pero cuesta tiempo, paciencia de la grada y no siempre está de tu parte.

## 2. Bucle principal (una jugada)
1. **Aviso**: el asistente te cuenta qué está pasando.
2. **Jugada en directo**: la ves una vez, a velocidad real, en vista cenital.
3. **Opinión de otros**: grada, asistente y sala VAR opinan (y a veces se equivocan o mienten).
4. **VAR (opcional)**: repetición frame a frame, zoom, cámara lateral y línea de fuera de juego.
   Tienes un número limitado de revisiones por partido.
5. **Decisión**: eliges qué pitar. No sabes si has acertado hasta el informe final.
6. **Reacción**: la grada reacciona según a quién perjudica tu decisión, no según si es correcta.

## 3. Bucle de partido / jornada
- Un partido = varias jugadas + un descanso con un evento (dilema moral).
- Al final, el **Comité Técnico de Árbitros** envía un informe: aciertos, errores, multas,
  sueldo y un sello (Aprobado / Suspenso / Expediente abierto).
- Cada jornada nueva trae **circulares**: reglas nuevas o cambiadas (como las normas diarias
  de *Papers, Please*).

## 4. Recursos
| Recurso | Qué representa | Cómo cambia |
|---|---|---|
| **Reputación** | Lo que piensa el comité de ti | Sube con aciertos, baja con errores |
| **Presión de grada** | Lo harta que está la afición local | Sube si pitas contra el local y con cada revisión VAR |
| **Revisiones VAR** | Veces que puedes pedir el VAR | Límite fijado por la circular de la jornada |
| **Dinero** | Tu sueldo de árbitro | Base + bonus por acierto − multas (+ sobornos) |

## 5. El VAR
- **Herramientas**: línea temporal frame a frame, cámara lenta, zoom, cámara lateral y
  línea de fuera de juego.
- **Baja resolución a propósito**: en directo la imagen es pequeña y pixelada; con zoom se
  ven detalles (un brazo pegado al cuerpo, un hombro adelantado) que en directo no.
- **La sala VAR es un personaje**: te recomienda revisar (o no). A veces acierta, a veces
  no, y a veces tiene intereses propios.
- **Coste**: cada revisión gasta una de las revisiones disponibles, añade minutos y sube la
  presión de la grada.

## 6. Moralidad y narrativa
- Sobornos (sobres en el vestuario), presiones de directivos, la prensa, tu familia...
- Las decisiones morales no se juzgan al momento; aparecen en informes posteriores.
- Idea de arco largo: empiezas en Tercera, puedes ascender hasta arbitrar una final... o
  acabar en un escándalo de corrupción.

## 7. Estilo visual
- **Prototipo**: pizarra táctica pixelada (círculos de colores sobre el campo).
- **Objetivo**: pixel art de baja resolución y paleta limitada, ambiente de cabina VAR
  (monitores, líneas de escaneo, tonos apagados con acentos ámbar).

## 8. Tecnología
- **Ahora**: prototipo web (HTML + JavaScript, un solo archivo) en `prototipo/index.html`.
  Se abre en cualquier navegador, sin instalar nada.
- **Más adelante**: cuando el diseño funcione, pasar a Godot 4.

## 9. Prototipo v0.1 (hecho)
Un partido: **Deportivo Norte – Atlético Sur**, Jornada 1.

| Min. | Jugada | Decisión correcta | Trampa |
|---|---|---|---|
| 12' | Contra por el centro | Anular por fuera de juego | Fuera por muy poco, solo se ve con la línea |
| 27' | Regate en el área | Amarilla por simulación | La sala VAR dice "penalti claro" |
| 41' | Centro al área | No es penalti | Brazo pegado: la circular dice que no es mano |
| Descanso | Sobre con 300 € | Entregarlo | Nadie te ve... |
| 63' | Entrada en el medio campo | Roja directa | La sala VAR (pro-Sur) la minimiza |
| 88' | Disparo desde fuera | Gol válido | La sala VAR te pide revisar sin motivo |

Circulares de la Jornada 1: máximo 3 revisiones VAR; la mano solo es penalti con el brazo
separado del cuerpo.

## 10. Próximos pasos (ideas)
- [ ] Jornada 2 con circulares nuevas y consecuencias del sobre.
- [ ] Más tipos de jugada: agresiones fuera del balón, protestas, pérdidas de tiempo.
- [ ] Tarjetas acumuladas a lo largo del partido (doble amarilla).
- [ ] Sonido: silbato, grada, pinganillo.
- [ ] Primer arte pixel art.
