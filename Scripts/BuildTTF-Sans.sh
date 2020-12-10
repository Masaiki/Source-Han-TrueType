#!/bin/bash
# This bash script generates TrueType version of Source Han Sans Subset.
# Note that this script depends on Adobe's AFDKO and otRebuilder, both of which could be found on GitHub.

# Clean-up of previous output files.
rm -rf Subset

# Create output folder.
mkdir Subset

# Locate to the work directory.
cd $1/SubsetOTF

# Convert otf files into ttf files in UPM 2048.
for folder in CN TW HK JP KR
do
	cd $folder
	for fontPath in *.otf
	do
		fontFileName="${fontPath##*/}"
		fontFilePre="${fontFileName%.*}"
		../../../otrebuild.exe --otf2ttf --UPM 2048 --removeGlyphNames --O1 -o $fontFilePre.ttf $fontPath
		mv -f $fontFilePre.ttf ../../../Subset/
	done
	cd ..
done
