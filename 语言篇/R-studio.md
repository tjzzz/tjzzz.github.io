# R-studio

http://cp01-ubskce18.epc.baidu.com:8787/
http://cq01-ubskce21.epc.baidu.com:8787


```

1. CentOS 6.3系统
2. Unless you do not want to view graphs on-screen (or use a Mac) you need ‘X11’ installed, including its headers and client libraries. For recent Fedora distributions it means (at least) RPMs ‘libX11’, ‘libX11-devel’, ‘libXt’ and ‘libXt-devel’. On Debian we recommend the meta-package ‘xorg-dev’. If you really do not want these you will need to explicitly configure R without X11, using --with-x=no.
3. 在我厂6.3系统上应该只需要：yum install libXt-devel.x86_64 -y
4. 使用jumbo local-install r.jumbo本地安装R（这里使用3.3.1版，使用新版tarball需要更新md5sum）
* 官网下载rstudio rpm包
sudo yum install --nogpgcheck rstudio-server-rhel-0.99.903-x86_64.rpm（替换为最新版）
sudo yum install libcrypto.so.6 -y
sudo yum install libgfortran.so.1 -y
sudo yum install libssl.so.6 -y
sudo yum install openssl098e-0.9.8e -y
sudo yum install gcc41-libgfortran-4.1.2 -y
sudo yum install pango-1.28.1 -y
sudo yum install libssl.so.10 -y
sudo yum install libcrypto.so.10 -y
sudo yum install xorg-x11-fonts-75dpi.noarch -y
sudo yum install xorg-x11-fonts-100dpi.noarch -y
sudo yum install xorg-x11-server-Xvfb.x86_64 -y
cp到/etc/init/: xvfb.conf
sudo initctl start xvfb
sudo DISPLAY=0 rstudio-server start
```



绘图相关
https://plot.ly/r/shiny-gallery/
http://shiny.rstudio.com/gallery/

addins
http://rstudio.github.io/rstudioaddins/


搭建一个简单的httpserver
python -m SimpleHTTPServer 8999

----
安装`rattle`包时候提示：

```
ERROR: configuration failed for package ‘RGtk2’
```


添加用户

