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
| **Dinero** | Tu sueldo de árbitro, en forintos | Base + bonus por acierto − multas (+ sobornos) |

## 5. El VAR
- **En directo ves con tus ojos**: cámara a pie de campo, detrás de la jugada y en diagonal,
  como corre un árbitro. Hay jugadores que tapan y ángulos malos.
- **Cámaras del VAR**: tribuna, detrás de la portería, contracampo y cenital (pizarra).
  Cada jugada tiene un ángulo "bueno" (la entrada se ve de lado desde la portería; la mano,
  de frente) y otros que engañan. Encontrarlo es parte del juego.
- **Herramientas**: línea temporal frame a frame, cámara lenta, zoom, dorsales y línea de
  fuera de juego pintada sobre el césped.
- **Baja resolución a propósito**: en directo la imagen es pequeña y pixelada; con zoom se
  ven detalles (un brazo pegado al cuerpo, un hombro adelantado) que en directo no.
- **La sala VAR es un personaje**: te recomienda revisar (o no). A veces acierta, a veces
  no, y a veces tiene intereses propios.
- **Coste**: cada revisión gasta una de las revisiones disponibles, añade minutos y sube la
  presión de la grada.

## 6. Historia

**Protagonista**: un árbitro húngaro (nombre elegido por el jugador; por defecto Szabó Gábor,
con el apellido primero, como en Hungría). Nace en 1974.

**Arco**: de la tercera división (NB III) en 1994 a la lista internacional y una final en 2019.
No es un héroe: es parte del sistema. Sube porque sabe a quién deber favores, cuándo mirar
hacia otro lado y cuándo no. El juego no premia ser bueno ni ser corrupto: cada camino tiene
su precio.

**Estructura**:
- **Prólogo (2019)**: mayo, Budapest, final de Copa, la primera del país con VAR. Última
  temporada del protagonista en la lista internacional. Es el partido jugable actual.
- **"Veinticinco años antes..."**: agosto de 1994, su ciudad de origen, tercera división.
  Un campo de tierra y 2.000 forintos por partido.
- **La carrera**: de los 90 a hoy. La tecnología llega mientras asciendes:
  - 90: solo tus ojos y los de tus asistentes. Nada de repeticiones.
  - 2000: pinganillo y televisión: la repetición llega después, en la prensa.
  - 2010: asistentes de área, apuestas online, amaños organizados.
  - 2019: VAR.

**Reglas del mundo**:
- País, ciudades, ligas y época: **reales** (Hungría, NB I/II/III, forintos).
- Clubes, directivos, periodistas y personajes: **inventados**. Nunca se nombra a clubes,
  personas ni organismos reales implicados en corrupción.
- Clubes del prólogo: **Dunavölgy SE** (local, celeste) y **Kőhegyi Dózsa** (visitante, coral;
  un club de tradición policial con amigos en el ministerio).

**Moralidad**: sobornos, favores, presiones políticas, la prensa, la familia. Las decisiones
no se juzgan al momento: vuelven más tarde, en informes, titulares o personajes.

## 7. Estilo visual
- **Prototipo**: estética de 16 bits. Imagen de 213x133 ampliada x3, paleta fija de 32 colores,
  tramado ordenado (Bayer) en césped, sombras y bruma, y sprites con colores planos de la paleta
  (luz, base y sombra) y contorno oscuro.
- **Luz de estadio nocturno**: cuatro torres de focos en las esquinas; cada jugador proyecta
  cuatro sombras en cruz, tiene un lado iluminado y otro en sombra, y bruma con la distancia.
- **Objetivo**: pixel art de baja resolución y paleta limitada, ambiente de cabina VAR
  (monitores, líneas de escaneo, tonos apagados con acentos ámbar).

## 8. Tecnología
- **Ahora**: prototipo web (HTML + JavaScript, un solo archivo) en `prototipo/index.html`.
  Se abre en cualquier navegador, sin instalar nada.
- **Más adelante**: cuando el diseño funcione, pasar a Godot 4.

## 9. Prototipo (v0.2)
Menú principal, licencia de árbitro (nombre y ciudad), y el prólogo: final de Copa 2019,
**Dunavölgy SE – Kőhegyi Dózsa**. La partida se guarda sola y se puede continuar desde el menú.

| Min. | Jugada | Decisión correcta | Trampa |
|---|---|---|---|
| 12' | Contra por el centro | Anular por fuera de juego | Fuera por muy poco, solo se ve con la línea |
| 27' | Regate en el área | Amarilla por simulación | La sala VAR dice "penalti claro" |
| 41' | Centro al área | No es penalti | Brazo pegado: la circular dice que no es mano |
| Descanso | Sobre con 3 millones de forintos | Entregarlo (o no...) | Nadie te ve... |
| 63' | Entrada en el medio campo | Roja directa | La sala VAR (pro-Sur) la minimiza |
| 88' | Disparo desde fuera | Gol válido | La sala VAR te pide revisar sin motivo |

Circulares de la final: máximo 3 revisiones VAR; la mano solo es penalti con el brazo
separado del cuerpo.

## 10. Partido rápido (prototipo v0.4)
La historia queda aparcada mientras se pule el bucle (el código de la licencia, el prólogo y el
epílogo sigue en el archivo). El árbitro **solo observa y decide**: no se controla su posición.

**El partido fluye**: 8 jugadas encadenadas. Muchas son juego limpio; el reto es saber cuándo
pitar y cuándo dejar jugar (como en *Papers, Please*: la mayoría de pasaportes están bien).
- Botón **¡PITAR!** (o barra espaciadora) en cualquier momento de la jugada. Al pitar, eliges
  qué pitas, o "no había nada" si te equivocaste (cortar el juego sin motivo penaliza).
- Si no pitas, el juego sigue. En los goles, decides al final si valen.
- Si se te escapa una infracción, a veces la sala VAR te llama (y a veces es falsa alarma).
- Jugadas: pase al hueco (fuera de juego o no), entrada en el área (penalti, piscinazo o
  limpia), centro al área (mano con brazo separado o pegado), entrada en el medio campo
  (limpia, amarilla o roja), disparo con jugada previa (empujón o limpio), **lejos del balón**
  (codazo o forcejeo) y juego sin incidencias.

**Cuatro barras** (a lo *Reigns*): confianza del comité, enfado de la grada local, enfado de
los visitantes y temperatura de los jugadores. Si una llega al límite, el partido se suspende:
invasión de campo, retirada del visitante, tángana o te relevan.
- Cuanto más caliente el partido, más infracciones y más duras.
- Dejar pasar infracciones calienta a los jugadores; las tarjetas justas los enfrían.

**Tarjetas acumuladas**: hay que recordar quién tiene amarilla; la segunda es expulsión. Los
amonestados tienden a reincidir. Los expulsados no vuelven a aparecer.

Cada jugada sale de la semilla del partido y de su estado (temperatura y tarjetas).

## 11. Próximos pasos (ideas)
- [ ] Hablar con los jugadores: preguntar tras una caída (pueden mentir), calmar o amonestar
  protestas (idea 4).
- [ ] Progresión entre partidos: circulares nuevas, reputación, mejoras (asistente, VAR extra),
  empezar sin VAR (idea 5).
- [ ] Ley de la ventaja.
- [ ] Primer partido de 1994 (sin VAR) en tercera división.
- [ ] Consecuencias del sobre del prólogo a lo largo de la carrera.
- [ ] Más tipos de jugada: agresiones fuera del balón, protestas, pérdidas de tiempo.
- [ ] Tarjetas acumuladas a lo largo del partido (doble amarilla).
- [ ] Sonido: silbato, grada, pinganillo.
- [ ] Primer arte pixel art.
