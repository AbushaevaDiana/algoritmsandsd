Program TreeInOut(INPUT, OUTPUT); 
{В  листьях  И-ИЛИ  дерева,  соответствующего некоторому
множеству  конструкций,  заданы   значения   массы.   Известно
максимально допустимое значение массы изделия. Требуется усечь
дерево   так,   чтобы   дерево    включало    все    элементы,
соответствующие  допустимым  значениям массы,  но не содержало
"лишних" вершин.  Конечное дерево выдать на экран в  наглядном
виде (13).
Абушаева Диана, ПС-22 

Формат ввода-вывода:

18
A a
.B o
..E 15
..F o
...X 5
...Y 12
...Z 11
..G a
...N 3
...O 14
.C 5
.D o
..H 2
..K 5
..L 9
..M 18

CTRL+D для ввода через консоль и обозначения конца файла
}

TYPE
  ukaz = ^uzel;
  uzel = RECORD
           name: string;    {имя вершины}
           left, right: ukaz; {сыновья}
           fath: ukaz;        {отец в исходном дереве}
           urov, maxWeight, minWeight: integer;    {уровень исходного дерева с 0, вес вершины}
           ch: char;
         END;
       
  Point = ^stek;
  stek = RECORD
            Ver:  ukaz;
            Next: point;
            Ns:   integer; {номер сына, по которому пошли вниз}
         END;
VAR
  max: integer;
  root: ukaz;
  Fin, Fout: text;
  stop: boolean;
  stopCh: char;

FUNCTION MinInt(x1, x2 : integer) : integer;
BEGIN
  IF x1 < x2 
  THEN
    MinInt := x1
  ELSE
    MinInt := x2
END; 
 
FUNCTION MaxInt(x1, x2 : integer) : integer;
BEGIN
  IF x1 > x2
  THEN
    MaxInt := x1
  ELSE
    MaxInt := x2
END;
  
  
PROCEDURE ObhodNizVerh(T: ukaz);     {обход снизу вверх}
VAR
  Top, Kon: point;
  K: ukaz;  
  
  PROCEDURE DOb(P: ukaz);  {включение в стек}
  BEGIN
    New(Kon);
    Kon^.Ver:=P;
    Kon^.Next:=Top;
    Kon^.Ns:=0;
    Top:=Kon
  END;

  PROCEDURE Udal;  {удаление из стека}
  BEGIN
    Kon:=Top;
    Top:=Top^.Next;
    Dispose(Kon)
  END;

BEGIN 
  Top:=NIL;
  K:=T;
  DOb(K); { занесение в стек корня }
  WHILE Top<>NIL 
  DO
    BEGIN
      Top^.Ns:=Top^.Ns+1;
      CASE Top^.Ns OF
        1: IF  Top^.Ver^.left<>NIL 
           THEN
             BEGIN
               DOb(Top^.Ver^.left)
             END;
        2: IF Top^.Ver^.right<>NIL
           THEN
             BEGIN
               DOb(Top^.Ver^.right)
             END;
        3: BEGIN
             IF (Top^.Ver^.fath <> NIL) AND (Top^.Ver^.fath^.ch = 'a')
             THEN
               BEGIN
                Top^.Ver^.fath^.maxWeight := Top^.Ver^.fath^.maxWeight + Top^.Ver^.maxWeight;
                Top^.Ver^.fath^.minWeight := Top^.Ver^.fath^.minWeight + Top^.Ver^.minWeight
               END;
             IF (Top^.Ver^.fath <> NIL) AND (Top^.Ver^.fath^.ch = 'o')
             THEN
               BEGIN
                Top^.Ver^.fath^.maxWeight := MaxInt(Top^.Ver^.fath^.maxWeight, Top^.Ver^.maxWeight);
                Top^.Ver^.fath^.minWeight := MinInt(Top^.Ver^.fath^.minWeight, Top^.Ver^.minWeight)
               END;
             Writeln('Вершина ', Top^.Ver^.name, '   ', Top^.Ver^.ch, '  ', Top^.Ver^.maxWeight, '  ', Top^.Ver^.minWeight);
             Udal
           END
    END
  END
END;  

PROCEDURE ObhodVerhNiz(T: ukaz; max: integer); {обход сверху вниз}
VAR
  Top, Kon: point;
  K: ukaz;  
  
  PROCEDURE DOb(P: ukaz);  {включение в стек}
  BEGIN
    New(Kon);
    Kon^.Ver:=P;
    Kon^.Next:=Top;
    Kon^.Ns:=0;
    Top:=Kon;
  END;

  PROCEDURE Udal;  {удаление из стека}
  BEGIN
    Kon:=Top;
    Top:=Top^.Next;
    Dispose(Kon);
  END;

BEGIN 
  Top:=NIL;
  K:=T;
  DOb(K); { занесение в стек корня }
  IF (Top^.Ver^.fath = NIL) 
  THEN
    Top^.Ver^.maxWeight := max;
  WriteLn('1Вершина ', Top^.Ver^.name, '   ', Top^.Ver^.ch, '  ', Top^.Ver^.maxWeight, '  ', Top^.Ver^.minWeight);
  WHILE Top<>NIL DO
    BEGIN
      Top^.Ns:=Top^.Ns+1;
      case Top^.Ns of
       1:  IF  Top^.Ver^.left<>NIL THEN
           BEGIN
             DOb(Top^.Ver^.left);
             IF (Top^.Ver^.fath <> NIL) AND (Top^.Ver^.ch = 'o')
             THEN
               Top^.Ver^.maxWeight := Top^.Ver^.fath^.maxWeight - (Top^.Ver^.fath^.minWeight - Top^.Ver^.minWeight);
             WriteLn('1Вершина ', Top^.Ver^.name, '   ', Top^.Ver^.ch, '  ', Top^.Ver^.maxWeight, '  ', Top^.Ver^.minWeight);
           END;
        2: IF Top^.Ver^.right<>NIL THEN
           BEGIN
             DOb(Top^.Ver^.right);
             IF (Top^.Ver^.fath <> NIL) AND (Top^.Ver^.ch = 'o')
             THEN
               Top^.Ver^.maxWeight := Top^.Ver^.fath^.maxWeight - (Top^.Ver^.fath^.minWeight - Top^.Ver^.minWeight);
             WriteLn('1Вершина ', Top^.Ver^.name, '   ', Top^.Ver^.ch, '  ', Top^.Ver^.maxWeight, '  ', Top^.Ver^.minWeight);
           END;
        3: Udal;
    END;
  END;
END;  
  
PROCEDURE FromFile(var F: text; max: integer; var ro: ukaz);
VAR
  i, m, k, Len, int, code: integer;
  R, S, str: string;   {для формирования строки выдачи}
  p, t, kon: ukaz;
BEGIN
  WHILE NOT Eof(F) DO
    BEGIN
      READLN(F, S);
      k := 0;
      Len := Length(S);
      WHILE S[k + 1] = '.' 
      DO 
        k := k + 1;  
      {k - уровень вершины, начиная с 0}
      R := Copy(S, k + 1, Len - k); 
      int := 0;
      WHILE R[int + 1] <> ' ' 
      DO 
        int := int + 1;
      str := Copy(R, int + 2, Length(R) - int);
      {имя вершины без точек}
      New(kon);
      kon^.name := R;
      kon^.left := NIL;
      kon^.right := NIL;
      kon^.urov := k;
      IF str[1] = 'a'
      THEN
        BEGIN
          kon^.ch := 'a';
          kon^.maxWeight := 0;
          kon^.minWeight := 0
        END;
      IF str[1] = 'o' 
      THEN
        BEGIN
          kon^.ch := 'o';
          kon^.maxWeight := 0;
          kon^.minWeight := max
        END;
      IF (str[1] <> 'a') AND (str[1] <> 'o')
      THEN
      BEGIN
        kon^.ch := 'v';
        val(str, kon^.maxWeight, code);
        val(str, kon^.minWeight, code)
      END;
      IF k = 0 THEN             {нулевой уровень - корень}
        BEGIN
          ro := kon;       {корень - для возврата в вызывающую}
          kon^.fath := NIL;
          m := 0;            {уровень предыдущей вершины}
          t := kon;          {указатель на предыдущую вершину }
          continue
        END;
      IF k > m THEN       {переход на следующий уровень}
        BEGIN
          t^.left := kon;
          kon^.fath := t
        END
      ELSE                    { k<>0 и k<=m }
        IF k = m THEN     { уровень, как у предыдущей}
          BEGIN
            t^.right := kon;
            kon^.fath := t^.fath         {отец тот же, что у брата}
          END
      ELSE                  { k < m - подъем по дереву на m-k уровней }
          BEGIN
            p := t;
            FOR i := 1 TO m-k 
            DO
               p := p^.fath;
            { p-предыдущая вершина того же уровня }
            kon^.fath := p^.fath; 
            { отец в исходном дереве тот же, что у брата }
            p^.right := kon
          END;
      m := k;        { запомнили текущий уровень }
      t := kon;      {для работы со следующей вершиной}
    END;              {конец WHILE}
END;  
  
PROCEDURE ToFile(var F: text; t: ukaz; max: integer);
{ выдача в файл в порядке сверху вниз }
Var
  j: integer;
  St: string;   { для формирования строки выдачи }
  p: ukaz;
BEGIN
  IF t <> NIL THEN
    BEGIN
      St := t^.name;   { имя без точек }
      p := t;
      For j := 1 to t^.urov DO  { отступ в зависимости от уровня }
        BEGIN
          p := p^.fath;
          St := '.' + St
        END;
      IF t^.minWeight <= max
      THEN
        BEGIN
          WriteLn(F, St);
          ToFile(F, t^.left, t^.maxWeight);
        END;
      ToFile(F, t^.right, max)
    END
END;


BEGIN
  stop := false;
  WHILE NOT stop
  DO
    BEGIN
      stop := true;
      Assign(Fin,'C:\Users\abu13\algoritmsandsd\3\input.txt');
      Assign(Fout,'C:\Users\abu13\algoritmsandsd\3\output.txt');
      Reset(Fin);
      Rewrite(Fout);
      
      READLN(Fin, max);
      FromFile(Fin, max, root);
      ObhodNizVerh(root);
      WRITELN;
      ObhodVerhNiz(root, max);
      ToFile(Fout, root, max);
      
      Close(Fin);
      Close(Fout);
      WRITELN('IF you want to reapet, write Y: ');
      READ(stopCh);
      IF stopCh = 'Y'
      THEN
        stop := false
    END
END.

