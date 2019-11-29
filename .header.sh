#!/bin/sh

echo "Content-Type: text/html"
echo "X-Powered-By: shell-blog"
echo ""

echo -n "<html>"
echo -n "<head>"
echo -n "<title>Chen Xiaoyuan's Blog</title>"
echo -n "<style>"
echo -n "body{margin:1em auto;width:80%;min-width:100px;line-height:1.05em;}"
echo -n "a:visited{color:purple;}"
echo -n "pre{word-wrap:break-word;white-space:pre-wrap;}"
echo -n "h1{font-size:1.20em;margin:0.1em auto;text-decoration:underline;text-align:center;}"
echo -n "h2{font-size:1.15em;margin:0.1em auto;text-decoration:underline;text-align:center;}"
echo -n "h3{font-size:1.10em;margin:0.1em auto;text-decoration:underline;}"
echo -n "h4{font-size:1.05em;margin:0.1em auto;text-decoration:underline;}"
echo -n "h5{font-size:1.00em;margin:0.1em auto;text-decoration:underline;}"
echo -n "h6{font-size:0.95em;margin:0.1em auto;text-decoration:underline;}"
echo -n "ul{margin:0;padding:0;list-style-type:none;}"
echo -n "li:before{content:'* ';}"
echo -n "</style>"
echo -n "</head>"
echo -n "<body>"
echo -n "<pre><code>"