#!/bin/sh

PRODUCT='NAKIVO Backup & Replication'
URL="https://download1474.mediafire.com/c6vtn95ag92g/5mudeqvb3p52nrf/NAKIVO_Transporter_Installer-10.5.0.r58301-x86_64.sh"
SHA256="600148848050acb86bb9b683117b9799b3b63f755101dcc63f71814f8605e5a6"

PRODUCT_ROOT="/usr/local/nakivo"
INSTALL="inst.sh"

curl --fail --tlsv1.2 -o $INSTALL $URL
if [ $? -ne 0 -o ! -e $INSTALL ]; then
    echo "ERROR: Failed to get $PRODUCT installer"
    rm $INSTALL >/dev/null 2>&1
    exit 1
fi

sh ./$INSTALL -s -i "$PRODUCT_ROOT" --eula-accept 2>&1
if [ $? -ne 0 ]; then
    echo "ERROR: $PRODUCT install failed"
    rm $INSTALL >/dev/null 2>&1
    exit 3
fi
rm $INSTALL >/dev/null 2>&1

exit 0
