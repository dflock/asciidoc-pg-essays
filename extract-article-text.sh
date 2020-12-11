tidy --doctype html5 --clean yes ./5founders.html > ../test-article-output-1.html

tidy -q --doctype html5 --clean yes --show-warnings no ./95.html | pup --color 'table:nth-of-type(1) table > tbody > tr > td'


cat ./95.html | html2text -style pretty -width 5000 | awk '{$1=$1};1'

cat ./95.html | html2text -style pretty -width 5000 | pandoc --to asciidoc > ../out/95.adoc