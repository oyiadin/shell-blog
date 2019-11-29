#!/bin/sed -Ef

s/\t/  /g
s/^ +$//

# HTML entities
s/(>=|=>)/\&ge\;/g
s/(<=|=<)/\&le\;/g
s/\&/\&amp\;/g
s/"/\&quot\;/g
s/'/\&apos\;/g
s/>/\&gt\;/g
s/</\&lt\;/g

# Metadata
/^-{2,}/ {
    # s/.*//
    N
    :metadata_start
    /-{2,}$/ {
        # s/-{2,}$//
        b
    }
    s%\n *([^<:][^:]*): *([^\n]+)%\n<b>\1:</b>\t<u>\2</u>%g
    N
    b metadata_start
}

# Code snippets
/^```/ {
    N
    s/^.*\n/<pre><code>/
    :code_start
    /\n``` *$/ {
        s%\n``` *$%</code></pre>%
        b
    }
    N
    b code_start
}

/^\* +/ {
    s%^\* +(.+)%<ul>\n<li>\1</li>%
    N
    :ul_start
    /\n\* +.+/ {
        s%\n\* +(.+)%\n<li>\1</li>%
        N
        b ul_start
    }
    s%\n([^\*<]|$)%\n</ul>&%
}

:md_inline

# ![x](x)
s%!\[([^]]+)\]\(([^)]+)\)%<img alt="\1" src="\2" />%g

# [x](x)
s%\[([^]]+)\]\(([^)]+)\)%<a href="\2">\1</a>%g

# #Headings
s%^#{6} *(.+) *(#{1})?%<h6>\1</h6>%g
s%^#{5} *(.+) *(#{1})?%<h5>\1</h5>%g
s%^#{4} *(.+) *(#{1})?%<h4>\1</h4>%g
s%^#{3} *(.+) *(#{1})?%<h3>\1</h3>%g
s%^#{2} *(.+) *(#{1})?%<h2>\1</h2>%g
s%^#{1} *(.+) *(#{1})?%<h1>\1</h1>%g

:basic

# http://xxx
s% [a-z0-9\-]+://([^ ]+) %<a href="&">\1</a>%Ig
s%<[a-z0-9\-]+://([^ ]+)>%<a href="&">\1</a>%Ig
