PROGRAM Sort_4(INPUT, OUTPUT);

{ 4. В текстовом файле задана последовательность целых чисел.
Отсортировать файл методом простого слияния с 4 лентами (8).
    PascalABC.NET 3.7.2
}

VAR
  Fin, Fout, F1, F2, F3, F4: TEXT;
  i1, i2, i, ff: INTEGER;
  stop: BOOLEAN;
  stopAll: CHAR;
  strIn, strOut: STRING;
   
{Procedure SortIs(i1, i2: INTEGER);
VAR 
  i: INEGER;
BEGIN
   IF i1 > i2
   THEN
     BEGIN
     END;
END;}

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
      Close(Fout);
      WRITELN('IF you want to reapet, write Y. If you want to stop, put enter: ');
      READLN(stopAll);
      IF stopAll = 'Y'
      THEN
        stop := false
   END
END.

