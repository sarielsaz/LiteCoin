#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

SARIELSAZD=${SARIELSAZD:-$SRCDIR/sarielsazd}
SARIELSAZCLI=${SARIELSAZCLI:-$SRCDIR/sarielsaz-cli}
SARIELSAZTX=${SARIELSAZTX:-$SRCDIR/sarielsaz-tx}
SARIELSAZQT=${SARIELSAZQT:-$SRCDIR/qt/sarielsaz-qt}

[ ! -x $SARIELSAZD ] && echo "$SARIELSAZD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($SARIELSAZCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for sarielsazd if --version-string is not set,
# but has different outcomes for sarielsaz-qt and sarielsaz-cli.
echo "[COPYRIGHT]" > footer.h2m
$SARIELSAZD --version | sed -n '1!p' >> footer.h2m

for cmd in $SARIELSAZD $SARIELSAZCLI $SARIELSAZTX $SARIELSAZQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
