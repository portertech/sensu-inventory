#!/bin/sh

if [ -e /etc/redhat-release ]; then
    rpm -qa --queryformat '%{NAME} %{VERSION} %{RELEASE} %{ARCH}\n'
    exit 0
fi

if cat /etc/os-release | grep -q debian; then
    dpkg-query -f '${Package} ${source:Upstream-Version} ${Version} ${Architecture}\n' -W
    exit 0
fi
