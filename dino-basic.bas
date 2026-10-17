10 REM --- INICIALIZACION ---
20 DIM y(7): LET y(1)=20: LET y(2)=18: LET y(3)=17: LET y(4)=17: LET y(5)=18: LET y(6)=20: LET y(7)=21: GO TO 490
30 REM --- BUCLE PRINCIPAL ---
40 LET oldpy=py
50 REM teclado/mando
60 IF PEEK 23560>0 THEN POKE 23560,0: IF j=0 THEN LET j=1
70 REM salto
80 IF j>0 THEN LET py=y(j): LET j=j+1: IF j>7 THEN LET j=0
90 REM actualiza dificultad
100 IF sc>200 THEN LET gp=3: GO TO 150
110 IF sc>150 THEN LET gp=5: GO TO 150
120 IF sc>100 THEN LET sp=1: GO TO 150
130 IF sc>50 THEN LET gp=8
140 REM movemos cactus
150 LET c1=c1-1: LET c2=c2-1
160 REM Si un cactus sale de pantalla, reaparece aleatoriamente detras del otro
170 IF c1<0 THEN PRINT AT 21,0; " ": LET c1=c2+31+INT (RND*6)
180 IF c2<0 THEN PRINT AT 21,0; " ": LET c2=c1+gp
190 REM dibujar
200 REM Dibujamos los cactus SOLO si ya han entrado en la pantalla
210 IF c1<31 THEN PRINT AT 21,c1; PAPER 4;" "; PAPER 1;" "
220 IF c2<31 THEN PRINT AT 21,c2; PAPER 4;" "; PAPER 1;" "
230 IF py<>oldpy THEN PRINT AT oldpy,5; " ";AT py,5; PAPER 2;" "
240 REM colisiones
250 IF (c1=5 OR c2=5) AND py=21 THEN GO TO 310
260 IF (c1=5 OR c2=5) AND py<>21 THEN LET sc=sc+10: BEEP 0.01,40
270 PAUSE sp
280 IF sx=0 THEN GO TO 440
290 IF sc=sm THEN LET sx=sx-1: LET sm=sm+30: GO TO 470
300 GO TO 40
310 REM --- GAME OVER ---
320 PRINT AT py,5; PAPER 2; INK 4; FLASH 1;" "
330 BEEP 0.15,4: BEEP 0.15,0: BEEP 0.15,-3: BEEP 0.4,-8
340 GO SUB 540
350 PRINT AT 8,7; PAPER 7;"    SCORE:         "
360 PRINT AT 8,18; PAPER 7;sc
370 PAUSE 1: PAUSE 0
380 GO TO 400
390 REM --- REINICIO ---
400 BORDER 3: PAPER 1: INK 0: CLS
410 REM sc=puntos, c1 y c2=cactus, py=jugador, j=salto, sx=x de sol, sm=puntos para siguiente movimiento del sol
420 LET sc=0: LET gp=12: LET c1=31: LET c2=c1+gp: LET py=21: LET j=0: LET sp=2: LET sm=30: POKE 23560,0
430 PRINT AT 21,5; PAPER 2;" "
440 LET sx=29
450 REM Dibujar el sol
460 PRINT AT 4,0; PAPER 1;"  ";AT 5,0; PAPER 1;"  "
470 PRINT AT 4,sx; PAPER 6;"  "; PAPER 1;" ";AT 5,sx; PAPER 6;"  "; PAPER 1;" "
480 GO TO 40
490 REM --- PANTALLA DE INICIO ---
500 BORDER 3: PAPER 1: INK 0: CLS
510 GO SUB 540
520 PAUSE 0
530 GO TO 400
540 REM --- SUBRUTINA: DIBUJAR MARCO Y TITULO ---
550 PRINT AT 3,7; PAPER 7;"                   "
560 PRINT AT 4,7; PAPER 7;"    DINO BASIC     "
570 PRINT AT 5,7; PAPER 7;"                   "
580 PRINT AT 6,7; PAPER 7;"  PULSA UNA TECLA  "
590 PRINT AT 7,7; PAPER 7;"                   "
600 PRINT AT 8,7; PAPER 7;"    SCORE: 0       "
610 PRINT AT 9,7; PAPER 7;"                   "
620 RETURN

