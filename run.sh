#! /bin/bash

JAR='jar/Calc.jar'

if [ -f "$JAR" ]; then
	if [ "$#" -gt 0 ]; then
		REDIR="$1"
		echo "[INFO] using file $1 as input"
		echo "*****************************"
		cat $1
		echo "*****************************"
	else
		REDIR='/dev/tty'
		echo "[INFO] waiting for user input"
	fi

	java -cp tools/beaver-rt.jar:jar/Calc.jar prog.DeskCalc < $REDIR
else
	echo 'Please run ant before'
	exit 1
fi

