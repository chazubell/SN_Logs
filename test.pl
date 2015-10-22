#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: test.pl
#
#        USAGE: ./test.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Chaz Ubell (), charles.ubell@honeywell.com
# ORGANIZATION: SSC
#      VERSION: 1.0
#      CREATED: 10/9/2015 9:41:03 PM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
use 5.014;
use File::Basename;
use Cwd;

my $cwd = cwd();
say $cwd;


my ($filename, $dirs, $suffix) = fileparse("review_logs.pl");
say "\$filename $filename, \$dirs $dirs, \$suffix $suffix";


($filename, $dirs, $suffix) = fileparse('C:\Users\e461183\workspace\VSE_logsi\\');
say "\$filename $filename, \$dirs $dirs, \$suffix $suffix";

#($filename, $dirs, $suffix) = basename('C:\Users\e461183\workspace\VSE_logs');

