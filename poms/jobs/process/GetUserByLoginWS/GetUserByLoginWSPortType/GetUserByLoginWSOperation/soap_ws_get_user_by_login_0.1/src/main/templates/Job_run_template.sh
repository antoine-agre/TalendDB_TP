#!/bin/sh
cd `dirname $0`
ROOT_PATH=`pwd`
java -Dtalend.component.manager.m2.repository=$ROOT_PATH/../lib -Xms256M -Xmx1024M -Dfile.encoding=UTF-8 -cp ${talend.job.sh.classpath} tp_archiservices_icy.soap_ws_get_user_by_login_0_1.SOAP_WS_Get_User_By_Login "$@"
