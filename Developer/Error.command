#!/bin/sh
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
  echo "Unknown Application"
  ;;
esac
# array 생성
nib=("AnchorsPage" "AstroStackFilesPage" "AstroStackResultsPage" "DataMergeManagerWindowController" "HyperlinkPage" "IndexPage" "LayerPage" "PackageDocumentWindowController" "ParagraphPage" "Preferences" "ResourceManagerWindowController" "SectionsWindowController" "SnapshotsPage" "TextFramePage" "TocPage" "UserStatusView" "WorkspacePresetWindowController")
# 변환
for (( i = 1; i < ${#nib[@]}; i++ )); do
  echo "Converting ${nib[i]}"
  ENGPATH=/Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/en.lproj
  KORPATH=/Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/ko.lproj
  ENGNAME="${ENGPATH}/${nib[i]}.nib"
  KORNAME="${KORPATH}/${nib[i]}.nib"
  sudo plutil -convert xml1 "${ENGNAME}/keyedobjects.nib"
  sudo rm -dr "${KORNAME}"
  sudo mkdir "${KORNAME}"
  sudo chmod 777 "${KORNAME}"
  sudo sed -f "${DICPATH}" "${ENGNAME}/keyedobjects.nib" > "${KORNAME}/keyedobjects.nib"
done
sudo rm -dr "${KORPATH}/Preferences.nib"
