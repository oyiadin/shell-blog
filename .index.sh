#!/bin/bash

$BLOG_ROOT/.header.sh

$BLOG_ROOT/.banner.sh

echo "\$ cat find_me"
cat find_me
echo ""

directories=(posts private)
for directory in ${directories[@]}; do
    echo "$ ls -1r <a href=\"$directory/\">$directory</a>"
    for item in `ls -1r $directory`; do
        if [ -f "$directory/$item" ]; then
            echo $item | sed "s%.*%<a href=\"/$directory/&\">&</a>%g"
        fi
    done
    echo ""
done


echo '$ cat about.md'
$BLOG_ROOT/.md2html.sed about.md
echo ""

$BLOG_ROOT/.footer.sh
