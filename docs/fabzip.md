# fabzip.md

## ZIPTOXML

Распаковать ZIP архивы

FOLDER папка, в которой расположены архивы

```
parameters FOLDER

local FOLDER_FNS, pathtemp, files, ii

FOLDER_FNS := nice_path( getprm( 'FOLDER_FNS', 'SUPPLIER', 1 ) )

if !empty( FOLDER )
  FOLDER_FNS := FOLDER
endif

pathtemp := nice_path( expanduncfilename( temppath ) )
cleardir( pathtemp ) // очищаем временную папку


files := directory( FOLDER_FNS + '*.zip' )

for ii := 1 to len( files )
  runprocess( 'winrar e -y "' + FOLDER_FNS + files[ ii, 1 ]  + '"' )
next

files := directory( pathtemp + '*.xml' )

FOR II := 1 TO LEN( files )
  MOVECOPYFILE( files[ ii, 1 ], pathtemp, FOLDER_FNS )
NEXT // скопировали файлы во временную папку

if not DirectoryExists( FOLDER_FNS + "ZIP" )
  ForceDirectories( FOLDER_FNS + "ZIP" )
end

files := directory( FOLDER_FNS + '*.zip' )
for ii := 1 to len( files )
  MoveCopyFile( files[ ii, 1 ], FOLDER_FNS, FOLDER_FNS + "ZIP", false )
next

DELETE_OLD_FILES( FOLDER_FNS + "ZIP", 60 )
```