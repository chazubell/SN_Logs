#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: review_logs.pl
#
#        USAGE: ./review_logs.pl

#  DESCRIPTION: Consolidate VSE logs looking for a specific string
#
#  need to take all the files in a folder and cat them together.
#  The assume file name format will be <some name>_log with older logs
#  having a
#
#  Stretch goal add color to what is found
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Chaz Ubell (), charles.ubell@honeywell.com
# ORGANIZATION: SSC
#      VERSION: 1.0
#      CREATED: 10/9/2015 10:01:12 AM
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;
use Readonly;
use Getopt::Long;
use File::Basename;
use Carp;
use 5.014;
use English;
use Cwd;

Readonly my $USAGE => <<'USAGE';
Usage: ParseLog.pl  --input <Directory|log_file_name> --regEx <String or RegEx to find> 
USAGE

my $input;
my $reg_ex;

my ( $file_name, $dir, $suffix );
my @log_data = [];

if ( scalar @ARGV == 0 ) {
    say $USAGE;
    exit;
}
GetOptions( "input=s" => \$input, "regEx=s" => \$reg_ex );

if ( -f $input ) {                              # get the other files
    ( $file_name, $dir, $suffix ) = fileparse( $input, qr/\.[^.]*/x );

    #TODO should check that this is not the base file name

    my $working_directory;
        if ( $dir cmp './' ) {
        $working_directory = cwd();
    }
    elsif (-d $input) {

        $working_directory = addBackSlashtoEnd($dir);
    }
        opendir my $dh, $working_directory or croak "FATAL: Could not open directory $working_directory $!\n";
        my @dirs =
            grep { !/^\./x && -f ( $working_directory . '/' . $_ ) && /${file_name}_\d{0,2}?$/x }
            readdir $dh;
        closedir $dh;
        say @dirs;
        exit;
    

        ;
    }

# open all the files in the folder
#

# add a final backslash ("\"") to the end of a directory name
sub addBackSlashtoEnd {
    my ($file_path) = @_;

#   make sure that the file is a directory and that there is not a "\" at the end
    $file_path .= "\\" if ( -d $file_path && $file_path !~ /\\$/x );
    return $file_path;
}



