#!/bin/sh

loadfile() {
	acq480_setFilterCoefficientsAll $(cat $1 | grep ^[-0-9])
}

case $# in
12)
	acq480_setFilterCoefficientsAll $*
1)
	if [ -e $1 ]; then
		loadfile $1;;
	elif [ -e /usr/local/coeff_sets/ADS5294/$1 ]; then
		loadfile /usr/local/coeff_sets/ADS5294/$1;;
	else
		echo ERROR file not found; exit 1;;
	fi
*)
	echo ERROR USAGE load.acq480.fir FILE \| 12 coeffs; exit 1;;
esac

