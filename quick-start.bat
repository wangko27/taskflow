@echo off
echo [INFO] ȷ��Ĭ��JDK�汾ΪJDK6.0�����ϰ汾,������JAVA_HOME.
echo [INFO] ȷ���Ѱ�װMaven��Ant������Ant lib������maven-ant-tasks-2.*.*.jar.
echo [INFO] ȷ�����籣�ֳ�ͨ��������Maven�ٷ���վ.

set MVN=mvn
set ANT=ant
set MAVEN_OPTS=%MAVEN_OPTS% -XX:MaxPermSize=128m

echo [Step 1] ����tools/springside �� %userprofile%\.m2\repository
xcopy /s/e/i/h/d/y "tools\springside" "%USERPROFILE%\.m2\repository\org\springside"

echo [Step 2] ����H2���ݿ�.
cd tools/h2
start "H2" %MVN% exec:java
cd ..\..\

echo [Step 3] ΪTaskFlow ��ʼ�����ݿ�, ����Jetty.
call %ANT% -f bin/db/build.xml init-db
start "ΪTaskFlow" %MVN% %OFF_LINE% jetty:run

echo [INFO] TaskFlow0.1 �����������.
echo [INFO] �ɷ���������ʾ��ַ:
echo [INFO] http://localhost:9090/taskflow

:end
pause