<p align="center">
    <img src="https://cdn.discordapp.com/attachments/1017854329887129611/1068174531048513596/Palen1x.png" alt="logo" width="250">
</p>
<br>
<p align="center">
<strong>Surface-compatible Linux distro that lets you install <a href="https://github.com/palera1n/palera1n-c">palera1n-c</a>.</strong><br>
    It aims to be easy to use, have a nice interface and support 32 and 64 bit CPUs.
</p>
<p align="center">
    <a href="#Information">Information</a> •
    <a href="#contributing">Contributing</a> •
    <a href="#credits">Credits</a>
</p>

<p align="center">
    <img src="https://cdn.discordapp.com/attachments/1017854329887129611/1068153144305008730/IMG_0807.png" alt="screenshot" width="950">
</p>

-------
# Warnings
- We are NOT responsible for any data loss. The user of this distro accepts responsibility should something happen to their device. While nothing should happen, jailbreaking has risks in itself. If your device is stuck in recovery, please run `palera1n -n` in `Shell`.

- [palera1n-c](https://github.com/palera1n/palera1n-c) will never work in VirtualBox, VMware or any virtual machine that doesn't support a PCI passthrough. If you receive a `Segmentation Fault` that's on you.

- Use `-f -c` or `-f -B` for Rootful when creating fakeFS/bindFS, you also must use *only* `-f` to boot fakeFS/bindFS, otherwise it'll spit out an error saying that you already created the fakeFS/bindFS or it'll freeze without fakeFS/bindFS.
    - (`-f -B` won't work on 16.x).

- This distro's purpose is to make [palera1n-c](https://github.com/palera1n/palera1n-c) easier and more intuitive(with TUI) to use within a stripped down distribution. Each option in `palera1n_options` correlates to what can be found in palera1n-c documentation. I am not including flags that the user will most likely never need, for example, `-i`. Further documentation on [palera1n-c](https://github.com/palera1n/palera1n-c) can be found [here](https://cdn.nickchan.lol/palera1n/artifacts/c-rewrite/palera1n.1.html).

- Not recommended to mix `Rootful` & `Rootless` types together, but it's still a complete valid option. If you have any issues on removing them both you may go to the Support Discord.

- `A9 and below` devices may need to rerun the jailbreak if it gets stuck on PongoOS booting. If palera1n-c is stuck, press `CTRL + C` and type `exit` to go back into palen1x_menu, and rerun palera1n (make sure you don't force reboot, if you do you may need to rerun this process).

- On `A11`, **you must disable your passcode while in the jailbroken state** (on iOS 16, you need to reset your device before proceeding with palera1n-c on `A11`).

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

# Contributing
Any contribution is always welcome :3

# Credits
- Asineth for [checkn1x](https://github.com/asineth0/checkn1x)
- The checkra1n team for [checkra1n](https://checkra.in)
- raspberryenvoie for [odysseyn1x](https://github.com/raspberryenvoie/odysseyn1x)
- [The Procursus Team](https://github.com/ProcursusTeam/) for [Procursus](https://github.com/ProcursusTeam/Procursus)
- [ElliesSurviving](https://github.com/ElliesSurviving) and [Classy Car](https://www.reddit.com/user/Hunter_Ware) for testing palen1x on `A9-` devices.
- [Everyone else who contributed to palen1x](https://github.com/palera1n/palen1x/graphs/contributors) & [palera1n-c](https://github.com/palera1n/palera1n-c/graphs/contributors)
- [linux-surface](https://github.com/linux-surface/surface-aggregator-module) for the surface-aggregator-module
- [stacko](https://stackoverflow.com/a/72541334)[verflow](https://stackoverflow.com/a/13301399)/[apache](https://mynewt.apache.org/latest/newt/install/newt_linux.html) for misc. information
