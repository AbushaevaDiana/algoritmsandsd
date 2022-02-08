PROGRAM Lab1(INPUT, OUTPUT);
VAR
  InStr, OutStr: STRING;
  Index, E, A: INTEGER;
  
BEGIN{Lab1}
  OutStr := '';
  WRITE('Введите вещественное число: ');
  IF NOT EOLN
  THEN
    BEGIN
      READ(InStr);
      
      {Введены неправильные данные}
      IF NOT((InStr[1] >= '0') AND (InStr[1] <= '9'))
      THEN
        WRITE('Введены неправильные данные')
      {Введены неправильные данные}
      ELSE
        BEGIN 
          
          {Цифры}
          IF LENGTH(InStr) = 1
          THEN
            OutStr := OutStr + InStr[1] + '.0';
          {Цифры}
          
          {Увелечение}
          IF (InStr[1] = '0') AND (LENGTH(InStr) > 2) AND (InStr[2] = '.') 
          THEN
            BEGIN
              E := 3;
              WHILE (InStr[E] = '0') AND (E <= LENGTH(InStr))
              DO
               INC(E, 1);
              OutStr := OutStr + InStr[E];
              OutStr := OutStr + '.';
              Index := E + 1;
          
              A := LENGTH(InStr);
              WHILE (A > 2) AND (InStr[A] = '0')
              DO
                DEC(A, 1);
            
              WHILE Index <= A
              DO
                BEGIN
                 OutStr := OutStr + InStr[Index];
                 INC(Index, 1)
                END;
              IF OutStr[LENGTH(OutStr)] = '.'
              THEN
                OutStr := OutStr + '0';
              DEC(E, 2);
              OutStr := OutStr + 'E-' + CHR(E + ORD('0'))
            END;
          {Увелечение}
          
          {Уменьшение}
          IF ('1' <= InStr[1]) AND (InStr[1] <= '9') AND (LENGTH(InStr) > 1)
          THEN
            BEGIN
              OutStr := OutStr + InStr[1];
              E := 2;
              OutStr := OutStr + '.';
              WHILE (InStr[E] <> '.') AND (E < LENGTH(InStr))
              DO
                INC(E, 1);
                  
              A := LENGTH(InStr);
              WHILE (A > 2) AND (InStr[A] = '0')
              DO
                DEC(A, 1);
                  
              Index := 2;
              WHILE Index <= A
              DO
                BEGIN
                  IF InStr[Index] <> '.'
                  THEN
                    OutStr := OutStr + InStr[Index];
                  INC(Index, 1)
                END;
              DEC(E, 1);
                
              IF E <> 0
              THEN
                OutStr := OutStr + 'E+' + CHR(E + ORD('0'));
                IF OutStr[LENGTH(OutStr)] = '.'
                THEN
                  OutStr := OutStr + '0'
          END
        {Уменьшение}
        END    
    END
  ELSE 
    WRITE('Данные не введены');
    
  WRITELN(OutStr)
END.{Lab1}