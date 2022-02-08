PROGRAM Sort_4(INPUT, OUTPUT);

{ 4. В текстовом файле задана последовательность целых чисел.
Отсортировать файл методом простого слияния с 4 лентами (8).
    PascalABC.NET 3.7.2
}

VAR
  Fin, Fout, F1, F2, F3, F4: TEXT;
  i1, i2, i3, i4, i, ff: INTEGER;
  stop: BOOLEAN;
  stopAll: CHAR;
  strIn, strOut: STRING;
   
Procedure Sort(i1, i2, i3, i4: INTEGER; F: TEXT);
CONST
  m = 4;
VAR 
  i, j, k: INEGER;
  arr: array[1..m] of INTEGER;
BEGIN
  arr[1] := i1;
  arr[2] := i2;
  arr[3] := i3;
  arr[4] := i4;
  FOR i := 1 TO m-1 DO
    FOR j := 1 TO m-i DO
      IF arr[j] > arr[j+1] 
      THEN 
        BEGIN
          k := arr[j];
          arr[j] := arr[j+1];
          arr[j+1] := k
        END;  
END;

BEGIN
  stop := false;
  WHILE NOT stop
  DO
    BEGIN
      stop := true;
      WRITELN('Enter the name of input file: ');
      READLN(strIn);
      Assign(Fin, strIn);
      Reset(Fin);
      
{Первый проход}      
      Assign(F1, 'C:\Users\abu13\algoritmsandsd\5\f1.txt');
      Assign(F2, 'C:\Users\abu13\algoritmsandsd\5\f2.txt');
      Rewrite(F1);
      Rewrite(F2);
      i := 0;
      ff := 1; 
      WHILE NOT EOF(Fin)
      DO
        BEGIN
          READLN(Fin, i);
          IF ff = 1
          THEN
            BEGIN
             WRITELN(F1, i);
             ff := 2
            END
          ELSE
            BEGIN
             WRITELN(F2, i);
             ff := 1
            END
        END;
      Close(F1);
      Close(F2);
{Первый проход-end}

{Второй проход}
      Assign(F1, 'C:\Users\abu13\algoritmsandsd\5\f1.txt');
      Assign(F2, 'C:\Users\abu13\algoritmsandsd\5\f2.txt');
      Reset(F1);
      Reset(F2);
      Assign(F3, 'C:\Users\abu13\algoritmsandsd\5\f3.txt');
      Assign(F4, 'C:\Users\abu13\algoritmsandsd\5\f4.txt');
      Rewrite(F3);
      Rewrite(F4);
      i := 0;
      ff := 3; 
      WHILE (NOT EOF(F1)) AND (NOT EOF(F2))
      DO
        BEGIN
          READLN(F1, i1);
          READLN(F2, i2);
          IF ff = 3
          THEN
            BEGIN
             IF i1 < i2
             THEN
               BEGIN
                 WRITELN(F3, i1);
                 WRITELN(F3, i2)
               END
             ELSE
               BEGIN
                 WRITELN(F3, i2);
                 WRITELN(F3, i1)
               END;
             ff := 4
            END
          ELSE
            BEGIN
             IF i1 < i2
             THEN
               BEGIN
                 WRITELN(F4, i1);
                 WRITELN(F4, i2)
               END
             ELSE
               BEGIN
                 WRITELN(F4, i2);
                 WRITELN(F4, i1)
               END;
             ff := 3
            END
        END;
      IF NOT EOF(F1)
      THEN
        BEGIN
          READLN(F1, i);
          IF ff = 3
          THEN
            WRITELN(F3, i)
          ELSE
            WRITELN(F4, i)
        END;
      IF NOT EOF(F2)
      THEN
        BEGIN
          READLN(F2, i);
          IF ff = 3
          THEN
            WRITELN(F3, i)
          ELSE
            WRITELN(F4, i)
        END;
        
      Close(F1);
      Close(F2);
      Close(F3);
      Close(F4);
{Второй проход}
      
      Close(Fin);
      WRITELN('IF you want to reapet, write Y. If you want to stop, put enter: ');
      READLN(stopAll);
      IF stopAll = 'Y'
      THEN
        stop := false
   END
END.

