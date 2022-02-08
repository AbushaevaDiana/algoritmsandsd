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

PROGRAM Floyd_UORshell(INPUT, OUTPUT);

CONST maxV=1000;
TYPE matr=ARRAY[1..maxV, 1..maxV] OF integer;
VAR 
  i, j, vertNum: integer;
  GR: matr;
  Fin, Fout: TEXT;
  stop: BOOLEAN;
  stopCh, pusto: CHAR;
  strIn, strOut: string;
  
{алгоритм поиска кратчайших путей  Флойда}
Procedure Floid(D: matr; V: integer);
VAR k, i, j: integer;
BEGIN
  FOR i := 1 TO V 
  DO 
    D[i, i] := 0;
 
  FOR k := 1 TO V 
  DO
    FOR i := 1 TO V 
    DO
      FOR j:=1 TO V 
      DO
        IF (D[i, k]<>0) AND (D[k, j]<>0) AND (i<>j) 
        THEN
          IF (D[i, k]+D[k, j]<D[i, j]) OR (D[i, j]=0) 
          THEN
            D[i, j]:=D[i, k]+D[k, j];
 
  FOR i:=1 TO V 
  DO
  BEGIN
    FOR j:=1 TO V 
    DO
      WRITE(Fout, D[i, j]:4);
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
     FOR i:=1 TO vertNum 
     DO
       FOR j:=1 TO vertNum 
       DO
         BEGIN
           GR[i, j] := 0
         END;
     WHILE NOT EOF(Fin)
     DO
       BEGIN
        READ(Fin, i);
        READ(Fin, pusto); 
        READ(Fin, j);
        READ(Fin, pusto);
        READ(Fin, GR[i, j]);
        GR[j, i] := GR[i, j];
        WRITELN(GR[i, j]);
      END;
  
    WRITELN(Fout, 'Матрица кратчайших путей:');
    Floid(GR, vertNum);

        
      Close(Fin);
      Close(Fout);
      WRITELN('IF you want to reapet, write Y: ');
      READLN(stopCh);
      IF stopCh = 'Y'
      THEN
        stop := false
    END
END.

