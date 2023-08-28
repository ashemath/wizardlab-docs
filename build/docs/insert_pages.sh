#!/bin/sh

ls $(pwd)/docs/source > pages

cut -d " " -f 1  pages > pages1

sed -E 's/(conf\.py)|(_static)|(_templates)|(images)|(index.rst)|(_draft_.*\.md)//' pages1 > pages2

sed '8r pages2' index_base.rst > pages3

sed -E 's/(.*\.md$)/\   \1/' pages3 > pages4

sed -e '8,${ \~^$~d  }' pages4 > page5

sed -e 's/Indices\+/\n&/g' page5

cp page5 $(pwd)/docs/source/index.rst

rm -f $(pwd)/page*
