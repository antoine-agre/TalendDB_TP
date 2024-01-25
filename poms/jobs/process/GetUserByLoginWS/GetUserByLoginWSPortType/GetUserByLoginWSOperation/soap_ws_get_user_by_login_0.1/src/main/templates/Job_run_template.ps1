$fileDir = Split-Path -Parent $MyInvocation.MyCommand.Path
cd $fileDir
java '-Dtalend.component.manager.m2.repository=%cd%/../lib' '-Xms256M' '-Xmx1024M' '-Dfile.encoding=UTF-8' -cp 'null' tp_archiservices_icy.soap_ws_get_user_by_login_0_1.SOAP_WS_Get_User_By_Login $args
