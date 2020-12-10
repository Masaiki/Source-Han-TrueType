#!/bin/bash
# This bash script generates TrueType version of Source Han Code JP.
# Note that this script depends on Adobe's AFDKO and otRebuilder, both of which could be found on GitHub. Apple's Font Tools for XCode could be found at developer.apple.com/fonts.

# Clean-up of previous output files.
rm -rf Full

# Create the work folder.
mkdir temp

# Locate to the source directory.
cd $1/OTF

# Copy source files to the temporary directory.
cp *.otf ../../temp/

# Locate to the work directory.
cd ../../temp

# Convert otf files into ttf files in UPM 2048.
for fontPath in *.otf
do
	fontFileName="${fontPath##*/}"
	fontFilePre="${fontFileName%.*}"
	../otrebuild.exe --otf2ttf --UPM 2048 --removeGlyphNames --O1 -o $fontFilePre.ttf $fontPath
done

# Pack ttf files into ttc files.
mkdir Full
otf2otc -o Full/SourceHanCodeJP-ExtraLight.ttc SourceHanCodeJP-ExtraLight.ttf SourceHanCodeJP-ExtraLightIt.ttf
otf2otc -o Full/SourceHanCodeJP-Light.ttc SourceHanCodeJP-Light.ttf SourceHanCodeJP-LightIt.ttf
otf2otc -o Full/SourceHanCodeJP-Normal.ttc SourceHanCodeJP-Normal.ttf SourceHanCodeJP-NormalIt.ttf
otf2otc -o Full/SourceHanCodeJP-Regular.ttc SourceHanCodeJP-Regular.ttf SourceHanCodeJP-RegularIt.ttf
otf2otc -o Full/SourceHanCodeJP-Medium.ttc SourceHanCodeJP-Medium.ttf SourceHanCodeJP-MediumIt.ttf
otf2otc -o Full/SourceHanCodeJP-Bold.ttc SourceHanCodeJP-Bold.ttf SourceHanCodeJP-BoldIt.ttf
otf2otc -o Full/SourceHanCodeJP-Heavy.ttc SourceHanCodeJP-Heavy.ttf SourceHanCodeJP-HeavyIt.ttf

# Apple's ftxmakettc also does the same job.
# ftxmakettc SourceHanCodeJP-ExtraLight.ttf SourceHanCodeJP-ExtraLightIt.ttf output/SourceHanCodeJP-ExtraLight.ttc
# ftxmakettc SourceHanCodeJP-Light.ttf SourceHanCodeJP-LightIt.ttf output/SourceHanCodeJP-Light.ttc
# ftxmakettc SourceHanCodeJP-Normal.ttf SourceHanCodeJP-NormalIt.ttf output/SourceHanCodeJP-Normal.ttc
# ftxmakettc SourceHanCodeJP-Regular.ttf SourceHanCodeJP-RegularIt.ttf output/SourceHanCodeJP-Regular.ttc
# ftxmakettc SourceHanCodeJP-Medium.ttf SourceHanCodeJP-MediumIt.ttf output/SourceHanCodeJP-Medium.ttc
# ftxmakettc SourceHanCodeJP-Bold.ttf SourceHanCodeJP-BoldIt.ttf output/SourceHanCodeJP-Bold.ttc
# ftxmakettc SourceHanCodeJP-Heavy.ttf SourceHanCodeJP-HeavyIt.ttf output/SourceHanCodeJP-Heavy.ttc

# Locate to the root directory.
mv Full ../
cd ..

# Clean-ups
rm -rf temp
