echo "번역할 프로그램을 선택합니다."
echo "1: Affinity Designer"
echo "2: Affinity Photo"
echo "3: Affinity Publisher"
read app

# 프로그램 선택
case ${app} in
  1 )
  APPNAME=Affinity\ Designer
  ;;
  2 )
  APPNAME=Affinity\ Photo
  ;;
  3 )
  APPNAME=Affinity\ Publisher
  ;;
  * )
  echo "알 수 없는 프로그램입니다. 1, 2, 3(으)로만 입력해주세요. Step 1을 다시 시작합니다."
  ~/github/Affin.ko/Step-1.command
  ;;
esac

# 함수
function step1() {
  sudo echo ${APPNAME}"을(를) 변환합니다."
  sudo plutil -convert xml1 ./en.lproj/* > ~/github/Affin.ko/Step-1.log 2>&1
  sudo plutil -convert xml1 ./ja.lproj/* > ~/github/Affin.ko/Step-1.log 2>&1
  sudo echo "ko.lproj 폴더를 생성합니다."
  sudo mkdir ./ko.lproj
}

# 스크립트 실행
cd /Applications/"${APPNAME}".app/Contents/Resources
step1
cd /Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources
step1
