#!/usr/bin/env perl

$lualatex = 'lualatex %O -enable-write18 -halt-on-error -interaction=nonstopmode -file-line-error  %S';
$pdf_mode = 4;
$max_repeat = 3;

$pdf_previewer = 'open -ga /Applications/Skim.app';
$hash_calc_ignore_pattern{'pdf'} = '^/(CreationDate|ModDate|ID) ';
