#!/usr/bin/env perl

$latex = 'uplatex -halt-on-error -interaction=nonstopmode -file-line-error %O %S';
$latex_silent = 'uplatex -halt-on-error -interaction=nonstopmode -file-line-error  %O %S';

$max_repeat = 5;

$pdf_mode = 3;

$bibtex = 'upbibtex %O %S';

#Mendexを使う(索引)
$makeindex = 'mendex %O -o %D %S';

#DVIからPDFへの変換
$dvipdf = 'dvipdfmx %O -o %D %S';

$pdf_previewer = "open -ga /Applications/Skim.app";
