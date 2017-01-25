# PngQuantNativeProcess

[pngquant](https://pngquant.org/) is a command-line utility and a library for lossy compression of PNG images. The conversion reduces file sizes significantly (often as much as 70%) and preserves full alpha transparency.

With this repository, we offer examples running pngquant as a native process from Unity and Adobe AIR.

This repository comes with two command lines script:
- `pngquant-windows.cmd` a batch file for Windows OS executing `pngquant.exe`.
- `pngquant-osx` a shell script for Mac OS X executing `pngquant`.

To start pngquant process, you've to execute the correct command line script (corresponding to your OS) and give as argument the path to the folder where the current pngs will be compressed and **overwrote**. Have a look on the *examples*.

Don't forget to ship pngquant and the command lines script with your application:
- with Adobe AIR, put them in the *Package Contents*.
- with Unity, add them inside the *StreamingAssets* folder.
