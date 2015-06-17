:: set the eID Middleware versions

@SET BASE_VERSION1=4
@SET BASE_VERSION2=1
@SET BASE_VERSION3=3

@FOR /F "tokens=1" %%i in ('"C:\Program Files (x86)\Git\bin\git.exe" rev-list --count HEAD') do @SET EIDMW_REVISION=%%i
::"C:\Program Files (x86)\Git\bin\git.exe" describe

@IF NOT DEFINED EIDMW_REVISION GOTO set_zero_revision
@IF "%EIDMW_REVISION%"=="" GOTO set_zero_revision
@IF EIDMW_REVISION==exported GOTO set_zero_revision

@GOTO end

:set_zero_revision
@echo [INFO] \eidmw_revision set to 000
@SET EIDMW_REVISION=0000

:end
