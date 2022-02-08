PROGRAM Lab1(INPUT, OUTPUT);
{ 20. Ninoaaeou i?ia?aiio ia?aaiaa aauanoaaiiiai ?enea a oi?io
eiinoaiou n ieaaa?uae  oi?eie  a no?ieiaii oi?iaoa. Oaeay ?anou
iaioennu aie?ia ninoiyou ec iaiie oeo?u (8)..
Aaooaaaa Aeaia IN-22. Dev+GNU Pascal 1.9.4.13}
VAR
  InNum: REAL;
  OutStr: STRING;
  Index, E, Int: INTEGER;
  
FUNCTION LastNul(OutStr: STRING; Index: INTEGER) : STRING;
BEGIN{Last}
  Index := LENGTH(OutStr);
  WHILE (Index > 3) AND (OutStr[Index] = '0')
  DO
    BEGIN
      DELETE(OutStr, Index, 1);
      Index := Index - 1
    END;
  LastNul := OutStr
END;{Last}

BEGIN{Lab1}
  OutStr := '';
  WRITE('Please enter real number: ');
  IF NOT EOLN
  THEN
    BEGIN
      READ(InNum);
      Index := 0;
      E := 0;
      
      {E = 0}
      IF ((InNum >= 1) AND (InNum < 10)) OR (InNum = 0)
      THEN
        BEGIN
          Int := TRUNC(InNum);
          OutStr := OutStr + CHR(Int + ORD('0')) + '.';
          WHILE (InNum >= 0) AND (Index < 10)
          DO
            BEGIN
              InNum := (InNum - Int)*10;
              Int := TRUNC(InNum);
              OutStr := OutStr + CHR(Int + ORD('0'));
              Index := Index + 1
            END;
          OutStr := LastNul(OutStr, Index)
        END;
      
      IF (InNum <= (-1)) AND (InNum > (-10))
      THEN
        BEGIN
          OutStr := OutStr + '-';
          InNum := InNum * (-1);
          Int := TRUNC(InNum);
          OutStr := OutStr + CHR(Int + ORD('0')) + '.';
          WHILE (InNum > 0) AND (Index < 10)
          DO
            BEGIN
              InNum := (InNum - Int)*10;
              Int := TRUNC(InNum);
              OutStr := OutStr + CHR(Int + ORD('0'));
              Index := Index + 1
            END;
          OutStr := LastNul(OutStr, Index)
        END;
      {E = 0}
      
      {E < 0}
      IF (InNum < 0) AND (InNum > -1) 
      THEN
        BEGIN
          OutStr := OutStr + '-';
          InNum := InNum * (-1);
          WHILE InNum < 1
          DO
            BEGIN
              InNum := InNum*10;
              E := E + 1
            END;
          Int := TRUNC(InNum);
          OutStr := OutStr + CHR(Int + ORD('0')) + '.';
          WHILE (InNum > 0) AND (Index < 10)
          DO
            BEGIN
              InNum := (InNum - Int)*10;
              Int := TRUNC(InNum);
              OutStr := OutStr + CHR(Int + ORD('0'));
              Index := Index + 1
            END;
          OutStr := LastNul(OutStr, Index);  
          OutStr := OutStr + 'E-' + CHR(E + ORD('0'))
        END;
        
        IF (InNum > 0) AND (InNum < 1) 
        THEN
          BEGIN
            WHILE InNum < 1
            DO
              BEGIN
                InNum := InNum*10;
                E := E + 1
              END;
            Int := TRUNC(InNum);
            OutStr := OutStr + CHR(Int + ORD('0')) + '.';
            WHILE (InNum > 0) AND (Index < 10)
            DO
              BEGIN
                InNum := (InNum - Int)*10;
                Int := TRUNC(InNum);
                OutStr := OutStr + CHR(Int + ORD('0'));
                Index := Index + 1
              END;
            OutStr := LastNul(OutStr, Index);
            OutStr := OutStr + 'E-' + CHR(E + ORD('0'))
          END;
      {E < 0}
      
      {E > 0}
      IF InNum > 10 
      THEN
        BEGIN
          WHILE InNum >= 10
          DO
            BEGIN
              InNum := InNum/10;
              E := E + 1
            END;
          Int := TRUNC(InNum);
          OutStr := OutStr + CHR(Int + ORD('0')) + '.';
          WHILE (InNum > 0) AND (Index < 10)
          DO
            BEGIN
              InNum := (InNum - Int)*10;
              Int := TRUNC(InNum);
              OutStr := OutStr + CHR(Int + ORD('0'));
              Index := Index + 1
            END;
          OutStr := LastNul(OutStr, Index);
          OutStr := OutStr + 'E+' + CHR(E + ORD('0'))
        END;
      
      IF InNum <= (-10) 
      THEN
        BEGIN
          OutStr := OutStr + '-';
          InNum := InNum * (-1);
          WHILE InNum >= 10
          DO
            BEGIN
              InNum := InNum/10;
              E := E + 1
            END;
          Int := TRUNC(InNum);
          OutStr := OutStr + CHR(Int + ORD('0')) + '.';
          WHILE (InNum > 0) AND (Index < 10)
          DO
            BEGIN
              InNum := (InNum - Int)*10;
              Int := TRUNC(InNum);
              OutStr := OutStr + CHR(Int + ORD('0'));
              Index := Index + 1
            END;
          OutStr := LastNul(OutStr, Index);
          OutStr := OutStr + 'E+' + CHR(E + ORD('0'))
        END;
      {E > 0}
      
      
    END
     
  ELSE 
    WRITE('You do not enter data!');
    
  WRITELN(OutStr)
END.{Lab1}
