#!/bin/bash
# 파일명 받아오기
read NAME

# Select Application
APPNAME=Affinity\ Designer
# APPNAME=Affinity\ Photo
# APPNAME=Affinity\ Publisher

# Select Dictionary
DICPATH=~/Affin.ko/DictionaryDesigner
# DICPATH=~/Affin.ko/DictionaryPhoto
# DICPATH=~/Affin.ko/DictionaryPublisher

#
### Select Main Menu or Frameworks
#
# ENGPATH=/Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/en.lproj/
# JAPPATH=/Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/ja.lproj/
# KORPATH=/Applications/"${APPNAME}".app/Contents/Frameworks/libcocoaui.framework/Versions/A/Resources/ko.lproj/
ENGPATH=/Applications/"${APPNAME}".app/Contents/Resources/en.lproj/
JAPPATH=/Applications/"${APPNAME}".app/Contents/Resources/ja.lproj/
KORPATH=/Applications/"${APPNAME}".app/Contents/Resources/ko.lproj/


# 번역
sudo sed -f "${DICPATH}" "${ENGPATH}${NAME}.nib" > "${KORPATH}${NAME}.nib"
