PROGRAM Floyd_UORshell(INPUT, OUTPUT);

CONST maxV=1000;
TYPE matr=ARRAY[1..maxV, 1..maxV] OF integer;
VAR i, j, n, inf: integer;

GR: matr;
{алгоритм Флойда-Уоршелла}
Procedure FU(D: matr; V: integer);
VAR k, i, j: integer;
BEGIN
  inf := 1000000;
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
      WRITE(D[i, j]:4);
    WRITELN
  END
END;
{главное блок программы}
BEGIN
  WRITE('Количество вершин в графе > '); READLN(n);
  WRITELN('Введите матрицу весов ребер:');
  FOR i:=1 TO n 
  DO
    FOR j:=1 TO n 
    DO
      BEGIN
        WRITE('GR[', i, '][', j, '] > ');
        READ(GR[i, j])
      END;
  WRITELN('Матрица кратчайших путей:');
  FU(GR, n)
END.