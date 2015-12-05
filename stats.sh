#!/bin/sh

book=`grep -o '[a-z-]*\.md' SUMMARY.md`

tbd=`cat $book | grep -c ^TBD`
titles=`cat $book | grep -c ^#`

words=`cat $book | wc -w`
lines=`cat $book | wc -l`

echo "Titles added: $titles"
echo "Sections to go: $tbd"
echo "Words: $words"
echo "Lines: $lines"

complete=`echo "scale=1; ($titles-$tbd)*100/$titles" | bc`

echo "Completeness: $complete %"