#!/bin/bash
wget http://nginx.org/download/nginx-1.16.1.tar.gz
tar xzf nginx-1.16.1.tar.gz
cd nginx-1.16.1
project_path=$PWD
cd src/http/modules
modules_path=$PWD
wget https://github.com/wandenberg/nginx-push-stream-module/archive/0.4.1.zip
unzip 0.4.1.zip
rm 0.4.1.zip
wget https://github.com/evanmiller/mod_zip/archive/1.2.0.zip
unzip 1.2.0.zip
rm 1.2.0.zip
mv mod_zip-1.2.0 ngx_mod_zip-1.2.0
wget https://github.com/openresty/headers-more-nginx-module/archive/v0.33.zip
unzip v0.33.zip
rm v0.33.zip
mv headers-more-nginx-module-0.33 headers-more-nginx-module
wget https://github.com/apache/incubator-pagespeed-ngx/archive/v1.13.35.2-stable.zip
unzip v1.13.35.2-stable.zip
rm v1.13.35.2-stable.zip
mv incubator-pagespeed-ngx-1.13.35.2-stable ngx_pagespeed-1.13.35.2
git clone https://github.com/google/ngx_brotli
cd ngx_brotli
git checkout tags/v1.0.0rc
git submodule update --init
cd $modules_path
wget https://github.com/openssl/openssl/archive/OpenSSL_1_1_1d.zip
unzip OpenSSL_1_1_1d.zip
rm OpenSSL_1_1_1d.zip
mv openssl-OpenSSL_1_1_1d openssl-1.1.1d
cd ngx_pagespeed-1.13.35.2
wget https://dl.google.com/dl/page-speed/psol/1.13.35.2-x64.tar.gz
tar xzf 1.13.35.2-x64.tar.gz
rm 1.13.35.2-x64.tar.gz
cd $project_path
yes | ./configure\
  --prefix=/etc/nginx\
  --sbin-path=/usr/sbin/nginx\
  --conf-path=/etc/nginx/nginx.conf\
  --error-log-path=/var/log/nginx/error.log\
  --http-log-path=/var/log/nginx/access.log\
  --pid-path=/var/run/nginx.pid\
  --lock-path=/var/run/nginx.lock\
  --http-client-body-temp-path=/var/cache/nginx/client_temp\
  --http-proxy-temp-path=/var/cache/nginx/proxy_temp\
  --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp\
  --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp\
  --http-scgi-temp-path=/var/cache/nginx/scgi_temp\
  --user=nginx\
  --group=nginx\
  --with-openssl=$modules_path/openssl-1.1.1d\
  --with-openssl-opt=enable-tls1_3\
  --with-http_ssl_module\
  --with-http_realip_module\
  --with-http_addition_module\
  --with-http_sub_module\
  --with-http_dav_module\
  --with-http_flv_module\
  --with-http_mp4_module\
  --with-http_gunzip_module\
  --with-http_gzip_static_module\
  --with-http_random_index_module\
  --with-http_secure_link_module\
  --with-http_stub_status_module\
  --with-http_auth_request_module\
  --with-http_v2_module\
  --with-mail\
  --with-mail_ssl_module\
  --with-file-aio\
  --with-ipv6\
  --add-module=$modules_path/nginx-push-stream-module-0.4.1\
  --add-module=$modules_path/ngx_mod_zip-1.2.0\
  --add-module=$modules_path/headers-more-nginx-module\
  --add-module=$modules_path/ngx_pagespeed-1.13.35.2\
  --add-module=$modules_path/ngx_brotli\
  --with-cc-opt='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic'\
  --with-debug\
&& make
