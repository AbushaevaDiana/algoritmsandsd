PROGRAM Lab1(INPUT, OUTPUT);
{ 20. ��������� ��������� �������� ������������� ����� � �����
��������� � ���������  ������  � ��������� �������. ����� �����
�������� ������ �������� �� ����� ����� (8)..
�������� ����� ��-22. Dev+GNU Pascal 1.9.4.13}
VAR
  InNum: REAL;
  OutStr: STRING;
  Index, E, Int: INTEGER;
  
PROCEDURE LastNul(OutStr: STRING; Index: INTEGER);
BEGIN{Last}
      {Last}
      Index := LENGTH(OutStr);
      WHILE (OutStr[Index] = '0') AND (Index > 3)
      DO
        BEGIN
          OutStr[Index] := '';
          Index := Index - 1 
        END;
      IF OutStr[Index] = '.'
      THEN
        OutStr := OutStr + '0'
      {Last}
END;{Last}
  
BEGIN{Lab1}
  OutStr := '';
  WRITE('?lease enter real number: ');
  IF NOT EOLN
  THEN
    BEGIN
      READ(InNum);
      Index := 0;
      E := 0;
      
      {E = 0}
      IF (InNum >= 0) AND (InNum < 10) 
      THEN
        BEGIN
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
          LastNul(OutStr, Index);
        END;
      
      IF (InNum <= (-1)) AND (InNum >= -9)
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
          LastNul(OutStr, Index); 
        END;
      {E = 0}
      
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
          LastNul(OutStr, Index);
          OutStr := OutStr + 'E+' + CHR(E + ORD('0'))
        END;
      {E<0}
      
    END
    
  
  ELSE 
    WRITE('You do not enter data');
    
  WRITELN(OutStr)
END.{Lab1}
