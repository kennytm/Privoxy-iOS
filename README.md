Privoxy for Jailbroken iOS
==========================

This project ports [Privoxy 3.0.26](http://www.privoxy.org/) to iOS as a Cydia package (*.deb).

Usage
-----

1. Requirement: iOS 7+, [jailbroken](https://canijailbreak.com/).
2. Install `org.ijbswa.privoxy_3.0.26_iphoneos-arm.deb`.
3. Enable the HTTP proxy
    * Go to Settings → Wi-Fi → (your network)
    * Click "Manual" under "HTTP Proxy"
    * Enter `127.0.0.1` for "Server", and `8118` for "Port"
4. Verify Privoxy is running by visiting <http://www.example.com/phpads/>. The URL should be blocked by Privoxy.

The Privoxy server is running as a background daemon. This package is *not* an iOS 9
[network extension](https://developer.apple.com/reference/networkextension). Privoxy can only be configured by modifying
the config file at `/etc/privoxy/config`.

Building
--------

1. [Install theos](https://github.com/theos/theos/wiki/Installation)
2. `export THEOS=/path/of/theos`
3. `make package FINALPACKAGE=1`

License
-------

GPLv2.
