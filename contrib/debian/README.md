
Debian
====================
This directory contains files used to package sarielsazd/sarielsaz-qt
for Debian-based Linux systems. If you compile sarielsazd/sarielsaz-qt yourself, there are some useful files here.

## sarielsaz: URI support ##


sarielsaz-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install sarielsaz-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your sarielsaz-qt binary to `/usr/bin`
and the `../../share/pixmaps/sarielsaz128.png` to `/usr/share/pixmaps`

sarielsaz-qt.protocol (KDE)

