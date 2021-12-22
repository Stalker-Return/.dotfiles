#/bash/bin

# Dependencies: xkblayout-state
chkey () {
	KEYNUM=$(xkblayout-state print '%c')
		case $KEYNUM in
			0)	xkblayout-state set 1 ;;
			1)	xkblayout-state set 2 ;;
			2)	xkblayout-state set 0 ;;
		esac
}
chkey
