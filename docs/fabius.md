# fabius.md

## GETTIME()

Возвращает системное время в формате числа N5.2 (ЧЧ.ММ)

## EXCEL >> FRO

Приём чеков из EXCEL

```
LOCAL B,E,F,G,H,I,K,L,J
LOCAL SQL, PARTOFTIME, II, AA, FLD, _
AA := RANGEFROMEXCEL()
IF EMPTY( AA )
  RETURN
ENDIF

FLD := ' NUMDOC,C,10; DATDOC,D; D1NAME,C,20; D2NAME,C,20; K1NAME,C,20;;
  NATTR7,N,10; SM,N,12,2; EXTSUM,N,12,2; NDSSUM,N,12,2; '

B := ASCANN( AA, 'Касса', 3 )
E := ASCANN( AA, 'Номер чека', 3 )
F := ASCANN( AA, 'ФД №', 3 )
G := ASCANN( AA, 'Дата чека', 3 )
H := ASCANN( AA, 'Время чека', 3 ) // КОЛОНКА 8
I := ASCANN( AA, 'Тип операции', 3 )
K := ASCANN( AA, 'Наличными', 3 )
L := ASCANN( AA, 'Безналичными', 3 )
J := ASCANN( AA, 'Сумма чека', 3 )

TRY
  _ := CreateTmpFile( fld, '_', ~IsFreeDel := true )

  FOR II := 5 TO LEN( AA[1] )
    ( _ )->( DBAPPEND() )

    ( _ )->D1NAME := AA[ B, II ]
    ( _ )->NUMDOC := AA[ E, II ]
    ( _ )->NATTR7 := AA[ F, II ]
    ( _ )->DATDOC := AA[ G, II ]
       PARTOFTIME := AA[ H, II ]
    ( _ )->K1NAME := AA[ I, II ]
    ( _ )->SM     := AA[ K, II ]
    ( _ )->EXTSUM := AA[ L, II ]
    ( _ )->NDSSUM := AA[ J, II ]

    PARTOFTIME := VAL( PARTOFTIME )
    PARTOFTIME := ROUND( PARTOFTIME, 6 )
    PARTOFTIME := FRAC( PARTOFTIME )
    PARTOFTIME := ROUND( PARTOFTIME, 6 )
    PARTOFTIME := ROUND( PARTOFTIME * 86400 )
    ( _ )->D2NAME := CONV_SEC_TO_HMS( PARTOFTIME, TRUE )

  NEXT

  FLD := { 'NUMDOC', 'DATDOC', 'D1NAME', 'D2NAME', 'K1NAME', ;
    'NATTR7', 'SUM', 'EXTSUM', 'NDSSUM' }
  SQL := [ SELECT NUMDOC, DATDOC, D1NAME, D2NAME, K1NAME, ;
    NATTR7, SM AS "SUM", EXTSUM, NDSSUM ;
    FROM ] + TmpFilePath( _ )
  AA := SQLTOARR( SQL, FLD )

FINALLY
  CLOSETABLE( _ )
END

if !isempty( aa )
  addall( 'OFD', '2', docs1->rgnum,, fld, aa )
endif

// D1NAME Касса, например, Магазин 8
// D2NAME ВРЕМЯ
// NUMDOC Номер чека
// NATTR7 ФД №
// DATDOC Дата чека
// K1NAME Тип операции
// SUM    Наличными
// EXTSUM Безналичными
// NDSSUM Сумма чека
```

## FRO1 >> OFD2

Обновление документа "Чеки ОФД" данными фабиуса 

```
LOCAL SQL

SQL := [ UPDATE OFD2 ;
  SET ;
    OFD2.NATTR1 = FRO1."SUM", ;
    OFD2.NATTR2 = FRO1.NATTR6, ;
    OFD2.NATTR5 = FRO1.EXTSUM ;
  FROM DOCS] + RET_F_EXT() + [ OFD2 ;
  LEFT OUTER JOIN ;
  DOCP] + RET_F_EXT() + [ FRO1 ;
  ON OFD2.DANAL1 = FRO1.DANAL2 AND OFD2.DATDOC = FRO1.DATDOC AND OFD2.NATTR7 = FRO1.NATTR7 ;
  WHERE OFD2.KINDDOC = 'OFD' AND OFD2.LVLNUM = '2' AND ;
    FRO1.KINDDOC = 'FRO' AND FRO1.LVLNUM = '1' AND ;
    OFD2.PARENT = '] + DOCS1->RGNUM + [' ]
SIMPLESQL( SQL, OPDATAPATH )

SQL := [ UPDATE OFD2 ;
  SET ;
    OFD2.NATTR3 = OFD2.NDSSUM - OFD2.NATTR1, ;
    OFD2.NATTR4 = OFD2.EXTSUM - OFD2.NATTR2, ;
    OFD2.NATTR6 = OFD2."SUM" - OFD2.NATTR5 ;
  FROM DOCS] + RET_F_EXT() + [ OFD2 ;
  WHERE ;
    OFD2.KINDDOC = 'OFD' AND ;
    OFD2.LVLNUM = '2' AND ;
    OFD2.PARENT = '] + DOCS1->RGNUM + [' ]
SIMPLESQL( SQL, OPDATAPATH )

REFRESH()

// OFD2
// ИТОГО  ОФД NDSSUM - ФАБИУС NATTR1 - РАЗНИЦА NATTR3
// безнал ОФД EXTSUM - ФАБИУС NATTR2 - РАЗНИЦА NATTR4
// нал    ОФД SUM    - ФАБИУС NATTR5 - РАЗНИЦА NATTR6

// OFD2.NATTR3 ИТОГО РАЗНИЦА

// OFD2.NATTR5 наличная оплата фабиус
// FRO1.EXTSUM наличная оплата фабиус

// OFD2.NATTR2 безналичная оплата фабиус
// FRO1.NATTR6 безналичная оплата фабиус

// OFD2.DANAL1 R179.KOD
// FRO1.DANAL2 R179.KOD

// OFD2.NATTR7 номер фискального документа
// FRO1.NATTR7 номер фискального документа

// SQL := [ SELECT * ;
//   FROM DOCS] + RET_F_EXT() + [ OFD2 ;
//   LEFT OUTER JOIN ;
//   DOCP] + RET_F_EXT() + [ FRO1 ;
//   ON OFD2.DANAL1 = FRO1.DANAL2 AND OFD2.DATDOC = FRO1.DATDOC AND OFD2.NATTR7 = FRO1.NATTR7 ;
//   WHERE OFD2.KINDDOC = 'OFD' AND OFD2.LVLNUM = '2' AND ;
//     FRO1.KINDDOC = 'FRO' AND FRO1.LVLNUM = '1' AND ;
//     OFD2.PARENT = '] + DOCS1->RGNUM + [' ]
```