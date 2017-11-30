prometheus-deb
===============

DEB packages for tools from [prometheus.io](https://prometheus.io/).

[![Build Status](https://travis-ci.org/jtyr/prometheus-deb.svg?branch=master)](https://travis-ci.org/jtyr/prometheus-deb)
[![Packagecloud](https://img.shields.io/badge/%E2%98%81-Packagecloud-707aed.svg)](https://packagecloud.io/prometheus-deb/release)


Packages
--------

Packages are built for the following products:

- [Prometheus](https://github.com/prometheus/prometheus)
- [Alertmanager](https://github.com/prometheus/alertmanager)
- [Pushgateway](https://github.com/prometheus/pushgateway)


Usage
-----

DEB packages created from this Git repository are hosted by
[Packagecloud](https://packagecloud.io/prometheus-deb/release). You can add the
APT repository like this:

```shell
curl -L https://packagecloud.io/prometheus-deb/release/gpgkey | apt-key add -
echo 'deb https://packagecloud.io/prometheus-deb/release/ubuntu/ xenial main' > /etc/apt/sources.list.d/prometheus.list
apt-get update
```

Then you can install individual packages:

```shell
apt-get install prometheus
apt-get install prometheus-alertmanager
apt-get install prometheus-pushgateway
...
```


Author
------

Jiri Tyr


License
-------

MIT
