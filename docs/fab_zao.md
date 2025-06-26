# fab_zao.md

## Документ OFD Чеки

Из личного кабинета ОФД надо выйгрузить чеки в EXCEL

Далее эта программа ЗАО загружает чеки в Фабиус

```c
local AG, SQL, aa, _
AA := RANGEFROMEXCEL()
IF EMPTY( AA )
  RETURN
ENDIF

local d, FLD, ii, z, a, F, G, H, L

a := ASCANN( AA, 'Дата и время', 11 )
d := ASCANN( AA, '№ за смену', 11 )
z := ASCANN( AA, '№ ФД', 11 )
F := ASCANN( AA, 'Тип операции', 11 )
G := ASCANN( AA, 'Наличными', 11 )
H := ASCANN( AA, 'Безналичными', 11 )
L := ASCANN( AA, 'Сумма', 11 )
AG := ASCANN( AA, 'Рег. № ККТ', 11 )

FLD := ' D3NAME,C,20; NUMDOC,C,10; NATTR7,N,10; K1NAME,C,20;;
  SM,N,12,2; EXTSUM,N,12,2; NDSSUM,N,12,2; REGNUM_KKT,C,16; '

TRY
  _ := CreateTmpFile( fld, '_', ~IsFreeDel := true )

  FOR II := 12 TO LEN( AA[1] ) - 2
    ( _ )->( DBAPPEND() )

    ( _ )->D3NAME := AA[ a, II ]
    ( _ )->NUMDOC := AA[ d, II ]
    ( _ )->NATTR7 := AA[ z, II ]
    ( _ )->K1NAME := AA[ F, II ]
    ( _ )->SM     := AA[ g, II ]
    ( _ )->EXTSUM := AA[ H, II ]
    ( _ )->NDSSUM := AA[ L, II ]
    ( _ )->REGNUM_KKT := AA[ AG, II ]

  NEXT



  FLD := { 'NUMDOC', 'D3NAME', 'K1NAME', 'NATTR7', 'SUM', 'EXTSUM', 'NDSSUM', 'K2NAME' }
  SQL := [ SELECT NUMDOC, D3NAME, K1NAME, NATTR7, SM AS "SUM", EXTSUM, NDSSUM, REGNUM_KKT as K2NAME  ;
    FROM ] + TmpFilePath( _ )
  AA := SQLTOARR( SQL, FLD )

FINALLY
  CLOSETABLE( _ )
END

if !isempty( aa )
  addall( 'OFD', '2', docs1->rgnum,, fld, aa )
endif


// numdoc № за смену
// NATTR7 № ФД
// D3NAME Дата и время
// K1NAME Тип операции
// SUM Наличными
// EXTSUM Безналичными
// NDSSUM Сумма


// REGNUM_KKT Рег. № ККТ   K2NAME
```