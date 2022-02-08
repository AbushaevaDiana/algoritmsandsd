PROGRAM Lab1(INPUT, OUTPUT);
{ 20. Составить программу перевода вещественного числа в форму
константы с плавающей  точкой  в строковом формате. Целая часть
мантиссы должна состоять из одной цифры (8).
Абушаева Диана ПС-22 PascalABC.NET 3.7.2}
VAR
  InNum: REAL;
  OutStr: STRING;
  E: INTEGER;
  
FUNCTION DelLastNul(OutStr: STRING) : STRING;
VAR
  Index: INTEGER;
BEGIN{Last}
  Index := LENGTH(OutStr);
  WHILE (OutStr[Index] = '0') AND (OutStr[Index-1] <> '.')
  DO
    BEGIN
      DELETE(OutStr, Index, 1);
      Index := Index - 1
    END;
  DelLastNul := OutStr
END;{Last}

FUNCTION StrE(E: INTEGER): STRING;
VAR
  Str, StrE1: STRING;
  A, Index: INTEGER;
BEGIN{StrE}
  StrE1 := '';
  IF E > 9
  THEN
    BEGIN
      Str := '';
      WHILE E > 9
      DO
        BEGIN
          A := E mod 10;
          E := E div 10;
          Str := Str + CHR(A + ORD('0'))
        END;
      Str := Str + CHR(E + ORD('0'));
      Index := LENGTH(Str);
      WHILE Index > 0 
      DO
        BEGIN
          StrE1 := StrE1 + Str[Index];
          Index := Index - 1
        END
    END
  ELSE
    StrE1 := StrE1 + CHR(E + ORD('0'));
    StrE := StrE1;
END;{StrE}

FUNCTION InNumToOutStr(OutStr: STRING; InNum: REAL): STRING;
VAR
  Index, Int: INTEGER; 
BEGIN{InNumToOutStr}
  Index := 0;
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
  InNumToOutStr := OutStr
END;{InNumToOutStr}


BEGIN{Lab1}
  OutStr := '';
  WRITE('Please enter real number: ');
  IF NOT EOLN
  THEN
    BEGIN
      READ(InNum);
      E := 0;
      
      {InNum = 0}
      IF InNum = 0 
      THEN
        OutStr := '0';
      {InNum = 0}
      
      {InNum < 0}
      IF InNum < 0
      THEN
        BEGIN
          OutStr := OutStr + '-';
          InNum := InNum * (-1)
        END;
      {InNum < 0}
      
      {E = 0}
      IF (InNum >= 1) AND (InNum < 10)
      THEN
        BEGIN 
          OutStr := InNumToOutStr(OutStr, InNum);
          OutStr := DelLastNul(OutStr)
        END;
      {E = 0}
      
      {E < 0}
      IF (InNum > 0) AND (InNum < 1)
      THEN
        BEGIN
          WHILE InNum < 1
          DO
            BEGIN
              InNum := InNum*10;
              E := E + 1
            END;
          OutStr := InNumToOutStr(OutStr, InNum);
          OutStr := DelLastNul(OutStr);  
          OutStr := OutStr + 'E-' + StrE(E)
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
          OutStr := InNumToOutStr(OutStr, InNum);
          OutStr := DelLastNul(OutStr);
          OutStr := OutStr + 'E+' + StrE(E)
        END;
      {E > 0}
    END
     
  ELSE 
    WRITE('You do not enter data!');
    
  WRITELN(OutStr)
END.{Lab1}
