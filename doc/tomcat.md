### tomcatセットアップチートシート(研修用)
ソラで書いてるところがあるため誤字脱字があるかもしれない

####  インストール
```.sh
wget http://ftp.tsukuba.wide.ad.jp/software/apache/tomcat/tomcat-7/v7.0.64/bin/apache-tomcat-7.0.64.tar.gz # 2015年 10月 12日
tar -xzvf apache-tomcat-7.0.64.tar.gz
sudo mkdir /opt/apache-tomcat
sudo mv apache-tomcat-7.0.64/ /opt/apache-tomcat/
sudo chown -R pollseed:pollseed /opt/apache-tomcat/
```

#### 実行
* http://192.168.33.101:8080 にアクセスして動作確認
```.sh
sudo -u pollseed /opt/apache-tomcat/apache-tomcat-7.0.64/bin/startup.sh
ps ax | grep tomcat
```

#### 配備
* hoge.htmlファイルを配置して
* http://192.168.33.101:8080/examples/jsp/hoge/hoge.html にアクセスして動作確認
```.sh
mkdir -p /opt/apache-tomcat/apache-tomcat-7.0.64/webapps/examples/jsp/hoge
```

#### サーブレット配備
* web.xmlにservletとservlet-mappingを追加
```.xml
<servlet>
  <servlet-name>Hoge</servlet-name>
  <servlet-class>Hoge</servlet-class>
</servlet>
<servlet-mapping>
  <servlet-name>Hoge</servlet-name>
  <url-pattern>/servlets/servlet/Hoge</url-pattern>
</servlet-mapping>
```

#### 実行
* Hoge.javaファイルをWEB-INF/classesに追加
* http://192.168.33.101:8080/examples/servlets/servlet/Hoge にアクセスして動作確認
```.sh
javac -classpath /opt/apache-tomcat/apache-tomcat-7.0.64/lib/servlet-api.jar Hoge.java
sudo -u pollseed /opt/apache-tomcat/apache-tomcat-7.0.64/bin/shutdown.sh
sudo -u pollseed /opt/apache-tomcat/apache-tomcat-7.0.64/bin/startup.sh
```
