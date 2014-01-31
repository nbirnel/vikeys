CC="/cygdrive/c/Program Files/AutoHotkey/Compiler/Ahk2Exe.exe"
PROG=vikeys

${PROG}.exe : src/${PROG}.ahk
	${CC} /in src/${PROG}.ahk 

test : ${PROG}.exe
	cygstart $?

dist :: ${PROG}.zip

${PROG}.zip :: ${PROG}.exe
	cd .. && \
		zip -r ${PROG}.zip ${PROG}/INSTALL.txt ${PROG}/${PROG}.exe 
	mv ../${PROG}.zip ./

push :: ${PROG}.zip
	scp ${PROG}.zip noah@www.birnel.org:~/birnel.org/birnel.org/~noah/software/${PROG}

clean ::
	rm -f ${PROG}.zip

