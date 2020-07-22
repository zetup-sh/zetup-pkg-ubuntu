ZETUP_PKG_LOCATION="${HOME}/zetup-pkg-ubuntu"

backupdir="${HOME}/dotfile_backups"

for f in ${backupdir}/*
do
  ! mv ${f} ${HOME}/${f}
done

rm -rf ${ZETUP_PKG_LOCATION}
rm -rf ~/init.sh*
rmdir ${backupdir}