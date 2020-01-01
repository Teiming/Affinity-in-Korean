echo "번역할 프로그램을 선택합니다."
echo "1: Affinity Designer"
echo "2: Affinity Designer Beta"
echo "3: Affinity Photo"
echo "4: Affinity Photo Beta"
echo "5: Affinity Publisher"
echo "6: Affinity Publisher Beta"
read app
case ${app} in
  1 )
  APPNAME=Affinity\ Designer
  ;;
  2 )
  APPNAME=Affinity\ Designer\ Beta
  ;;
  3 )
  APPNAME=Affinity\ Photo
  ;;
  4 )
  APPNAME=Affinity\ Photo\ Beta
  ;;
  5 )
  APPNAME=Affinity\ Publisher
  ;;
  6 )
  APPNAME=Affinity\ Publisher\ Beta
  ;;
  * )
  echo "알 수 없는 프로그램입니다. 1, 2, 3, 4, 5, 6(으)로만 입력해주세요."
  ~/Affin.ko/Affin.ko-convert
  ;;
esac

echo ${APPNAME}"를 변환합니다."
sudo plutil -convert xml1 /Applications/"${APPNAME}".app/Contents/Resources/en.lproj/*
sudo plutil -convert xml1 /Applications/"${APPNAME}".app/Contents/Resources/ja.lproj/*
sudo plutil -convert xml1 /Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/en.lproj/*
sudo plutil -convert xml1 /Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/ja.lproj/*
echo "ko.lproj 폴더를 생성합니다."
sudo mkdir /Applications/"${APPNAME}".app/Contents/Resources/ko.lproj
sudo mkdir /Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/ko.lproj
echo -n "다른 프로그램을 번역하려면 Affin.ko-convert를 다시 시작해주세요. (y or n) "
read restart
if [[ ${restart} -eq "y" ]]; then
  ~/Affin.ko/Affin.ko-convert
else
  exit
fi