<p align="center">
<strong>Surface-compatible Linux distro that lets you install <a href="https://github.com/palera1n/palera1n">palera1n</a>.</strong><br>
    It aims to be easy to use and have a nice interface.
</p>

-------

This distro's purpose is to make [palera1n](https://github.com/palera1n/palera1n) easier and more intuitive(with TUI) to use within a stripped down distribution. Each option in `palera1n_options` correlates to what can be found in palera1n documentation. I am not including flags that the user will most likely never need, for example, `-i`. Further documentation on [palera1n](https://github.com/palera1n/palera1n) can be found [here](https://cdn.nickchan.lol/palera1n/artifacts/c-rewrite/palera1n.1.html).

# Information
**Make an [iCloud/iTunes backup](https://support.apple.com/en-us/HT203977) before using, so that you can go back if something goes wrong**.

- Downloads for palen1x-surface can be found [here](https://github.com/L1ghtmann/palen1x-surface/releases).

- Guide for palen1x can be found [here](https://ios.cfw.guide/using-palen1x/).

# Building palen1x-surface
To change the version of palen1x, either change `version` file, or manually specify it with `./build.sh`.

Execute these commands on a Debian-based system.

```sh
git clone https://github.com/L1ghtmann/palen1x-surface
cd palen1x-surface
sudo ./build.sh
```

# Credits
- Asineth for [checkn1x](https://github.com/asineth0/checkn1x)
- raspberryenvoie for [odysseyn1x](https://github.com/raspberryenvoie/odysseyn1x)
- [Everyone else who contributed to palen1x](https://github.com/palera1n/palen1x/graphs/contributors)
- [linux-surface](https://github.com/linux-surface/surface-aggregator-module) for the surface-aggregator-module
- [stacko](https://stackoverflow.com/a/72541334)[verflow](https://stackoverflow.com/a/13301399)/[apache](https://mynewt.apache.org/latest/newt/install/newt_linux.html) for misc. information
