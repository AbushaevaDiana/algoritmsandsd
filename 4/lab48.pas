PROGRAM Algor_Floid(INPUT, OUTPUT);

{ 16. Реализовать алгоритм поиска кратчайших путей  Флойда  и
проиллюстрировать по шагам этапы его выполнения (9).
    Абушаева Диана ПС-22
    PascalABC.NET 3.7.2
 Формат ввода
 4
 1 2 7
 2 4 16
 3 1 8
}

TYPE 
  matr=ARRAY[,] OF STRING;
  matrPos = ARRAY[,] OF INTEGER;
VAR 
  i, j, vertNum, startW, endW: INTEGER;
  Graf: matr;
  GrafPos: matrPos;
  Fin, Fout: TEXT;
  stop, stopGr: BOOLEAN;
  pusto, stopAll, stopWay: CHAR;
  strIn, strOut: STRING;
  
  
  
Procedure FindMinWay(Graf: matr; GrafPos: matrPos; startW, endW: INTEGER);
BEGIN
  IF Graf[startW, endW] <> '*'
  THEN
    BEGIN
      WRITELN('Min way = ', Graf[startW, endW]);
      WRITE('The way: ', startW, '-');
      WHILE GrafPos[startW, endW] <> endW
      DO
        BEGIN
          startW := GrafPos[startW, endW];
          WRITE(startW, '-');
        END;
      WRITELN(endW)
    END
  ELSE
    WRITELN('No ', startW, '-', endW, ' way') 
END;


  
{алгоритм Флойда}
Procedure Floid(Graf: matr; GrafPos: matrPos; V: INTEGER);
VAR 
  k, i, j, int, int1, int2, int3, Code: INTEGER;
BEGIN
  FOR i := 1 TO V 
  DO 
    Graf[i, i] := '0';
 
  FOR k := 1 TO V 
  DO
    BEGIN
      FOR i := 1 TO V 
      DO
        FOR j := 1 TO V 
        DO
          IF (Graf[i, k] <> '*') AND (Graf[k, j] <> '*') AND (i <> j) 
          THEN
            BEGIN
              VAL(Graf[i, k], int1, Code);
              VAL(Graf[k, j], int2, Code);
              VAL(Graf[i, j], int3, Code);
              IF ((int1 + int2) < int3) OR (Graf[i, j] = '*') 
              THEN
                BEGIN
                  VAL(Graf[i, j], int, Code);
                  STR((int1 + int2), Graf[i, j]);
                  VAL(Graf[i, j], int3, Code);
                  IF int <> int3
                  THEN
                    GrafPos[i, j] := k
                END
            END;
      WRITELN('The step № ', k);
      FOR i:=1 TO V 
      DO
        BEGIN
         FOR j:=1 TO V 
         DO
           WRITE('   ', Graf[i, j]);
         WRITE('      |  ');
         FOR j:=1 TO V 
         DO
            WRITE(GrafPos[i, j]:4);
           WRITELN
        END
    END;
    
  WRITELN(Fout, 'Матрица кратчайших путей:');
  FOR i:=1 TO V 
  DO
  BEGIN
    FOR j:=1 TO V 
    DO
      WRITE(Fout, Graf[i, j]:4);
    WRITELN(Fout)
  END
END;


BEGIN
  stop := false;
  WHILE NOT stop
  DO
    BEGIN
      stop := true;
      WRITELN('Enter the name of input file: ');
      READLN(strIn);
      WRITELN('Enter the name of output file: ');
      READLN(strOut);
      Assign(Fin, strIn);
      Assign(Fout, strOut);
      Reset(Fin);
      Rewrite(Fout);
      
     READLN(Fin, vertNum);
     Graf := new string[vertNum+1, vertNum+1];
     GrafPos := new integer[vertNum+1, vertNum+1];
     FOR i:=1 TO vertNum 
     DO
       FOR j:=1 TO vertNum 
       DO
         BEGIN
           Graf[i, j] := '*';
           
           GrafPos[i, j] := 0;
           IF i = j
           THEN
             GrafPos[i, j] := i
         END;
     WHILE NOT EOF(Fin)
     DO
       BEGIN
        READ(Fin, i);
        READ(Fin, pusto); 
        READ(Fin, j);
        READ(Fin, pusto);
        READ(Fin, Graf[i, j]);
        GrafPos[i, j] := j;
      END;
    
     Floid(Graf, GrafPos, vertNum);
     
     stopGr := false;
     WHILE NOT stopGr
     DO
       BEGIN
         stopGr := true;
         
         WRITELN('Enter the start of way: ');
         READLN(startW);
         WRITELN('Enter the end of way: ');
         READLN(endW);
         FindMinWay(Graf, GrafPos, startW, endW);
         
         WRITELN('IF you want to reapet finding min way, write Y. If you want to stop, put enter: ');
         READLN(stopWay);
         IF stopWay = 'Y'
         THEN
           stopGr := false
       END;
      
      
     Close(Fin);
     Close(Fout);
     WRITELN('IF you want to reapet entering of matric, write Y. If you want to stop, put enter: ');
     READLN(stopAll);
     IF stopAll = 'Y'
     THEN
       stop := false
   END
END.

