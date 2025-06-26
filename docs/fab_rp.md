# fab_rp.md

## 26.06.2025

## RP_00_41_43_GHC

Выравнивание 00-41 и 43

В оборотной ведомости фабиуса, это файл MTUN

существует счёт 43 и его зеркальное отражение, счёт 00-41

Данная программа выравнивает 43 счёт и счёт 00-41

За основу я беру счёт 00-41, а 43 "ломаю" 

Таким образом, на конец месяца остатки по этим счетам будут сходится

После выполнения этой программы

Программа запускается из модуля

Главная книга - Бухгалтерские справки - Документы бухг.справок

F6 - нажать на три точки ... и выбрать программу *RP_00_41_43_GHC*

```
LOCAL msg, ACNT43, aa, CSP, fld, ACNT90, SQL, _2, _

if TYPE( 'CURDATE' ) = 'U'
  local CURDATE
  CURDATE := date()
endif

SQL := [ SELECT top 1 DISTINCT debt ;
    FROM prvs] + RET_F_EXT( CURDATE ) + [ ;
    WHERE DEBT LIKE '90] + DLM + [2%' AND KRED LIKE '43%' AND ;
        KREFL1 = 'R20 ' AND KANAL1 > 0 AND ;
        KREFL2 = 'R11 ' AND KANAL2 > 0 ]
ACNT90 := sqltoarr( sql )

fld := ' REFLANAL,C,4; ANAL,N,5; REFL,C,4; KOD,N,5; EAMNT,N,14,4; '

try

  WAITMSG( 'Подготовка данных', msg )

  _ := CreateTmpFile( fld, '_', ~IsFreeDel := true )
  _2 := CreateTmpFile( fld, '_2', ~IsFreeDel := true )

  SQL := [ SELECT REFLANAL, ANAL, REFL, KOD, EAMNT ;
    FROM MTUN] + RET_F_EXT( CURDATE ) + [ ;
    WHERE ;
        EAMNT <> 0 AND BKACNT LIKE '00] + DLM + [41%' and ;
        REFLANAL = 'R20 ' and ANAL > 0 and ;
        REFL = 'R11 ' and KOD > 0 ]
  SimpleSql( [ Insert into ] + TmpFilePath( _2 ) + [ ;
      ( REFLANAL, ANAL, REFL, KOD, EAMNT ) ] + sql, OpdataPath )

  SQL := [ SELECT REFLANAL, ANAL, REFL, KOD, -EAMNT ;
    FROM MTUN] + RET_F_EXT( CURDATE ) + [ ;
    WHERE ;
        EAMNT <> 0 AND BKACNT LIKE '43%' and ;
        REFLANAL = 'R20 ' and ANAL > 0 and ;
        REFL = 'R11 ' and KOD > 0 ]
  SimpleSql( [ Insert into ] + TmpFilePath( _2 ) + [ ;
      ( REFLANAL, ANAL, REFL, KOD, EAMNT ) ] + sql, OpdataPath )

  sql := [ select REFLANAL, ANAL, REFL, KOD, ;
      SUM( EAMNT ) ;
      FROM ] + TmpFilePath( _2 ) + [ ;
      group by REFLANAL, ANAL, REFL, KOD ;
      HAVING SUM( EAMNT ) <> 0 ]
  SimpleSql( [ Insert into ] + TmpFilePath( _ ) + [ ;
      ( REFLANAL, ANAL, REFL, KOD, EAMNT ) ] + sql, OpdataPath )

  fld := ' AMNT,N,14,4;;
      DEBT,C,12; DREFL1,C,4; DANAL1,N,5; DREFL2,C,4; DANAL2,N,5; DREFL3,C,4; DANAL3,N,5;;
      KRED,C,12; KREFL1,C,4; KANAL1,N,5; KREFL2,C,4; KANAL2,N,5; KREFL3,C,4; KANAL3,N,5; '

  CSP := CreateTmpFile( fld, 'CSP', ~IsFreeDel := true )
  sql := [ select REFLANAL KREFL1, ANAL KANAL1, REFL KREFL2, KOD KANAL2, EAMNT AMNT ;
      from ] + TmpFilePath( _ )

  SimpleSql( [ Insert into ] + TmpFilePath( CSP ) + [( KREFL1, KANAL1, KREFL2, KANAL2, AMNT ) ] + sql, OpdataPath )

  SQL := [ SELECT top 1 DISTINCT KRED ;
      FROM prvs] + RET_F_EXT( CURDATE ) + [ ;
      WHERE DEBT LIKE '] + ACNT90 + [' AND KRED LIKE '43%' AND ;
          KREFL1 = 'R20 ' AND KANAL1 > 0 AND ;
          KREFL2 = 'R11 ' AND KANAL2 > 0 ]
  ACNT43 := sqltoarr( sql )

  sql := [ update ;
    ] + TmpFilePath( CSP ) + [ ;
    set KRED = '] + ACNT43 + [' ]
  simplesql( sql, temppath )

  ( CSP )->( DBGOTOP() )
  while !( CSP )->( eof() )
    ( CSP )->DEBT := ACNT90
    ( CSP )->DREFL1 := 'R267'
    ( CSP )->DANAL1 := RET_R267_KOD( ( CSP )->KANAL2 )
    ( CSP )->DREFL2 := 'R01'
    ( CSP )->DANAL2 := factorykod
    ( CSP )->DREFL3 := ( CSP )->KREFL2
    ( CSP )->DANAL3 := ( CSP )->KANAL2
    ( CSP )->( dbskip() )
  end

  fld := { 'debt', 'kred', ;
          'drefl1', 'drefl2', 'drefl3', 'danal1', 'danal2', 'danal3', ;
          'krefl1', 'krefl2', 'krefl3', 'kanal1', 'kanal2', 'kanal3', ;
          'amnt' }

  sql := [ select debt, kred, drefl1, drefl2, drefl3, danal1, danal2, danal3, ;
                              krefl1, krefl2, krefl3, kanal1, kanal2, kanal3, ;
                              AMNT from ] + TmpFilePath( CSP )
  aa := sqltoarr( sql, fld )
  


finally
  closetable( CSP )
  closetable( _2 )
  closetable( _ )
  HIDEMSG( msg )
end

if !isempty( aa )
  addall( 'CSP', '2', docs1->rgnum,, fld, aa, ~IsRepl := FALSE )
endif

// CSP
```


