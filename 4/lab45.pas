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

PROGRAM Algor_Floid(INPUT, OUTPUT);

TYPE matr=ARRAY[,] OF integer;
VAR 
  i, j, vertNum, ves: integer;
  Graf: matr;
  Fin, Fout: TEXT;
  stop: BOOLEAN;
  stopCh, pusto: CHAR;
  strIn, strOut: string;
  
{алгоритм поиска кратчайших путей  Флойда}
Procedure Floid(Graf: matr; V: integer);
VAR k, i, j: integer;
BEGIN
  FOR i := 1 TO V 
  DO 
    Graf[i, i] := 0;
 
  FOR k := 1 TO V 
  DO
    BEGIN
      FOR i := 1 TO V 
      DO
        FOR j:=1 TO V 
        DO
          IF (Graf[i, k] <> 0) AND (Graf[k, j] <> 0) AND (i <> j) 
          THEN
            IF (Graf[i, k] + Graf[k, j] < Graf[i, j]) OR (Graf[i, j] = 0) 
            THEN
              Graf[i, j] := Graf[i, k] + Graf[k, j];
      WRITELN('The step № ', k);
      FOR i:=1 TO V 
      DO
        BEGIN
         FOR j:=1 TO V 
         DO
           WRITE(Graf[i, j]:4);
           WRITELN
        END
    END;
 
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
     Graf := new integer[vertNum+1, vertNum+1];
     FOR i:=1 TO vertNum 
     DO
       FOR j:=1 TO vertNum 
       DO
         BEGIN
           Graf[i, j] := 0
         END;
     WHILE NOT EOF(Fin)
     DO
       BEGIN
        READ(Fin, i);
        READ(Fin, pusto); 
        READ(Fin, j);
        READ(Fin, pusto);
        READ(Fin, Graf[i, j]);
        WRITELN(Graf[i, j]);
      END;
  
    WRITELN(Fout, 'Матрица кратчайших путей:');
    Floid(Graf, vertNum);

        
      Close(Fin);
      Close(Fout);
      WRITELN('IF you want to reapet, write Y: ');
      READLN(stopCh);
      IF stopCh = 'Y'
      THEN
        stop := false
    END
END.

