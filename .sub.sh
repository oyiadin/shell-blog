#!/bin/sh

if [ -f "/$BLOG_ROOT/$BLOG_PWD" ]; then
    $BLOG_ROOT/.header.sh
    $BLOG_ROOT/.banner.sh

    echo "\$ cat $BLOG_PWD"
    echo ""
    $BLOG_ROOT/.md2html.sed /$BLOG_ROOT/$BLOG_PWD
    echo ""

    $BLOG_ROOT/.footer.sh

elif [ -d  "/$BLOG_ROOT/$BLOG_PWD" ]; then
    $BLOG_ROOT/.header.sh
    $BLOG_ROOT/.banner.sh

    echo '$ pwd'
    echo $BLOG_PWD
    echo ""

    echo '$ ls -1r .'
    echo '<a href=".">.</a>'
    echo '<a href="..">..</a>'
    for item in `ls -1r .`; do
        if [ -f "$item" ]; then
            echo $item | sed "s%.*%<a href=\"${BLOG_PWD}&\">&</a>%g"
        fi
    done
    echo ""

    $BLOG_ROOT/.footer.sh

else
    echo "Status: 404"
    echo ""
    echo "oops, 404 not found"
fi
