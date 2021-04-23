#!/bin/bash
echo "Check Update"
cd ~/Affin.ko/
git pull
echo "Select Application"
echo "1: Affinity Designer"
echo "2: Affinity Photo"
echo "3: Affinity Publisher"
read Application
case ${Application} in
  1 )
  APPNAME=Affinity\ Designer
  DICPATH=~/Affin.ko/DictionaryDesigner
  ;;
  2 )
  APPNAME=Affinity\ Photo
  DICPATH=~/Affin.ko/DictionaryPhoto
  ;;
  3 )
  APPNAME=Affinity\ Publisher
  DICPATH=~/Affin.ko/DictionaryPublisher
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
  ENGPATH=/Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/en.lproj/
  JAPPATH=/Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/ja.lproj/
  KORPATH=/Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/ko.lproj/
else
  ENGPATH=/Applications/"${APPNAME}".app/Contents/Resources/en.lproj/
  JAPPATH=/Applications/"${APPNAME}".app/Contents/Resources/ja.lproj/
  KORPATH=/Applications/"${APPNAME}".app/Contents/Resources/ko.lproj/
fi
# 번역
FILECOUNT=$(ls -a "${JAPPATH}" | grep "i" | sed -n "=" | tail -n "1")
for (( i = 1; i <= ${FILECOUNT}; i++ ))
do
  NAME=$(/bin/ls "${JAPPATH}" | /usr/bin/sed -n "${i}p")
  echo -n "${i}/${FILECOUNT} ${NAME}"
  sudo sed -f "${DICPATH}" "${ENGPATH}${NAME}" > "${KORPATH}${NAME}"
  echo " (번역 종료)"
done
# 오류체크
~/Affin.ko/Error.command
