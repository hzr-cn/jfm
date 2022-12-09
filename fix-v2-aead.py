#!/usr/bin/env python

import re
import os
import os.path

file_paths = ['/etc/systemd/system/v2ray.service', '/etc/systemd/system/v2ray@.service',  '/etc/systemd/system/v2ray.service.d/10-donot_touch_single_conf.conf', '/etc/systemd/system/v2ray@.service.d/10-donot_touch_single_conf.conf']
for file_path in file_paths:
    if os.path.exists(file_path):
        with open(file_path, 'r') as f:
            data = f.read()
            data = data.replace("ExecStart=/usr/local/bin/v2ray", "ExecStart=/usr/bin/env v2ray.vmess.aead.forced=false /usr/local/bin/v2ray")

        with open(file_path, 'w') as f:
            f.write(data)

os.system('systemctl daemon-reload')
os.system('systemctl restart v2ray')
