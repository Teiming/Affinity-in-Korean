echo "Check Update"
cd ~/github/Affin.ko/
git pull
echo "Select Application"
echo "1: Affinity Designer"
echo "2: Affinity Photo"
echo "3: Affinity Publisher"
read Application
case ${Application} in
  1 )
  APPNAME="Designer"
  ;;
  2 )
  APPNAME="Photo"
  ;;
  3 )
  APPNAME="Publisher"
  ;;
  * )
  echo "Unknown Application."
  ;;
esac

echo "Select Main Menu or Frameworks"
echo "1: Main Menu"
echo "2: Frameworks"
read Frameworks
if [[ ${Frameworks} -eq 2 ]]; then
  SUPPATH=/Applications/Affinity\ ${APPNAME}.app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/
else
  SUPPATH=/Applications/Affinity\ ${APPNAME}.app/Contents/Resources/
fi

FILECOUNT=$(ls -a "${SUPPATH}ja.lproj/" | grep "i" | sed -n "=" | tail -n "1")
for (( i = 1; i <= ${FILECOUNT}; i++ ))
do
  NAME=$(ls "${JAPPATH}" | sed -n "${i}p")
  echo "${i}/${FILECOUNT} ${NAME}"
  sudo sed -f "~/github/Affin.ko/Dictionary/"${APPNAME} "${SUPPATH}en.lproj/${NAME}" > "${SUPPATH}ko.lproj/${NAME}"
  echo " (번역 종료)"
done
