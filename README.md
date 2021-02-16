# custom-nginx
Install tools:
```bash
yum install wget curl unzip gcc-c++ pcre-devel zlib-devel libuuid-devel
```
Run build script:
```bash
./build.sh
```
You will see question:
```bash
You have set --with-debug for building nginx, but precompiled Debug binaries for
PSOL, which ngx_pagespeed depends on, aren't available.  If you're trying to
debug PSOL you need to build it from source.  If you just want to run nginx with
debug-level logging you can use the Release binaries.

Use the available Release binaries? [Y/n]
```
Enter `y`.
