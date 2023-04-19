#!/bin/bash


monta_alias ()
{
cat /etc/multipath/bindings | grep ^mpa > /tmp/multipath
HST=$(hostname)
INC=1
        while read XX; do
                INC=$(($INC +1))
                PUID=$(echo "$XX" | awk '{print $2}')
                PMPA=$(echo "$XX" | awk '{print $1}')
                echo "multipath {" >> /tmp/alias.mpath
                echo "  wwid "$PUID" " >> /tmp/alias.mpath
                echo "  alias "$PMPA"_"$HST"_ora_asm_"$INC"" >> /tmp/alias.mpath
                echo "}" >> /tmp/alias.mpath
        done < /tmp/multipath
}
monta_alias
