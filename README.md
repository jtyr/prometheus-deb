prometheus-deb
===============

DEB packages of products from [prometheus.io](https://prometheus.io/).


Usage
-----

DEB packages produced from this Git repository are served by
[PackageCloud](https://prometheus.io/). You can add the APT repository like
this:

```shell
curl -L https://packagecloud.io/jtyr/prometheus-deb/gpgkey | apt-key add -
echo 'deb https://packagecloud.io/jtyr/prometheus-deb/ubuntu/ xenial main' > /etc/apt/sources.list.d/prometheus.list
apt-get update
apt-get install prometheus
```


Author
------

Jiri Tyr


License
-------

MIT
