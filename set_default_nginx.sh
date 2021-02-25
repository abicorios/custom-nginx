#!/bin/bash
bin=/usr/sbin
if [[ -f "$bin/nginx.custom" && -L "$bin/nginx.custom" && -f "$bin/nginx.bac" ]]; then
  service nginx stop
  rm -f $bin/nginx
  cp $bin/nginx{.bac,}
  service nginx start
fi