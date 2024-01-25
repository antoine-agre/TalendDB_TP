%~d0
cd %~dp0
java -Dtalend.component.manager.m2.repository="%cd%/../lib" -Xms256M -Xmx1024M -Dfile.encoding=UTF-8 -cp ${talend.job.bat.classpath} tp_archiservices_icy.soap_ws_get_user_by_login_0_1.SOAP_WS_Get_User_By_Login %*
