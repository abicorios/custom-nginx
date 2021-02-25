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

You need save the standard file `/usr/sbin/nginx`, and add the symlink on the built binary, for example:
```bash
cd /usr/sbin
cp nginx{,.bac}
ln -s /home/bitrix/custom-nginx/nginx-1.16.1/objs/nginx nginx.custom
```
You need do it manually, to understand what do you do.

Then, if you need use new custom nginx, run by root (sudo or login as root):
```bash
./set_custom_nginx.sh
```
To come back default nginx, run by root:
```bash
./set_default_nginx.sh
```
These scripts use names `nginx.bac` and `nginx.custom`, so you need use these names of backup and symlink.

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
