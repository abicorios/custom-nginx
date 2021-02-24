# custom-nginx
Install tools:
```bash
yum install wget curl unzip gcc-c++ pcre-devel zlib-devel libuuid-devel
```
Run build script:
```bash
./build.sh
```
Next, you can use this build as you need, an installation is not automatized because a stability reason.

Also, you can use splitter to see output of `nginx -V` https://abicorios.github.io/splitter/

# usage

You can rename the standard file `/usr/sbin/nginx` to save it, and add the symlink to the built binary, for example:
```bash
cd /usr/sbin/nginx
mv nginx{,.b}
ln -s /home/bitrix/custom-nginx/nginx-1.16.1/objs/nginx
service nginx restart
```

If you need use the debug log, you can find the configs which contain `var_log`:
```bash
cd /etc/nginx
grep -r error_log
```
Then you can edit the found files to the debug level: `error_log /var/log/nginx/error.log debug`. Then `service nginx restart`.

# refs
Thank you:

https://fornex.com/help/install-pagespeed-nginx-centos/

https://github.com/smartfile/nginx-mod-zip
