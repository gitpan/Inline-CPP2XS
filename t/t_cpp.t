use warnings;
use strict;
use Inline::CPP2XS qw(cpp2xs);

print "1..3\n";

cpp2xs('Math::Geometry::Planar::GPC::Inherit', 'main');

if(!rename('Inherit.xs', 'Inherit.txt')) {
  print "not ok 1 - couldn't rename Inherit.xs\n";
  exit;
}

my $ok = 1;

if(!open(RD1, "Inherit.txt")) {
  print "not ok 1 - unable to open Inherit.txt for reading: $!\n";
  exit;
}

if(!open(RD2, "expected_cpp.txt")) {
  print "not ok 1 - unable to open expected_cpp.txt for reading: $!\n";
  exit;
}

my @rd1 = <RD1>;
my @rd2 = <RD2>;

if(scalar(@rd1) != scalar(@rd2)) {
  print "not ok 1 - Inherit.txt does not have the expected number of lines\n";
  close(RD1) or print "Unable to close Inherit.txt after reading: $!\n";
  close(RD2) or print "Unable to close expected_cpp.txt after reading: $!\n";
  exit;
}

for(my $i = 0; $i < scalar(@rd1); $i++) {
   # Try to take care of platform-specific issues with line endings.
   $rd1[$i] =~ s/\n//g;
   $rd2[$i] =~ s/\n//g;
   $rd1[$i] =~ s/\r//g;
   $rd2[$i] =~ s/\r//g;

   if($rd1[$i] ne $rd2[$i]) {
     print $i, "\n", $rd1[$i], "*\n", $rd2[$i], "*\n";
     $ok = 0;
     last;
   }
}

if(!$ok) {
  print "not ok 1 - Inherit.txt does not match expected_cpp.txt\n";
  close(RD1) or print "Unable to close Inherit.txt after reading: $!\n";
  close(RD2) or print "Unable to close expected_cpp.txt after reading: $!\n";
  exit;
}

print "ok 1\n";

close(RD1) or print "Unable to close Inherit.txt after reading: $!\n";
close(RD2) or print "Unable to close expected_cpp.txt after reading: $!\n";
if(!unlink('Inherit.txt')) { print "Couldn't unlink Inherit.txt\n"}

$ok = 1;

###########################################################################

if(!open(RD1, "INLINE.h")) {
  print "not ok 2 - unable to open INLINE.h for reading: $!\n";
  exit;
}

if(!open(RD2, "expected.h")) {
  print "not ok 2 - unable to open expected.h for reading: $!\n";
  exit;
}

@rd1 = <RD1>;
@rd2 = <RD2>;

if(scalar(@rd1) != scalar(@rd2)) {
  print "not ok 2 - INLINE.h does not have the expected number of lines\n";
  close(RD1) or print "Unable to close INLINE.h after reading: $!\n";
  close(RD2) or print "Unable to close expected.h after reading: $!\n";
  exit;
}

for(my $i = 0; $i < scalar(@rd1); $i++) {
   # Try to take care of platform-specific issues with line endings.
   $rd1[$i] =~ s/\n//g;
   $rd2[$i] =~ s/\n//g;
   $rd1[$i] =~ s/\r//g;
   $rd2[$i] =~ s/\r//g;

   if($rd1[$i] ne $rd2[$i]) {
     $ok = 0;
     last;
   }
}

if(!$ok) {
  print "not ok 2 - INLINE.h does not match expected.h\n";
  close(RD1) or print "Unable to close INLINE.h after reading: $!\n";
  close(RD2) or print "Unable to close expected.h after reading: $!\n";
  exit;
}

close(RD1) or print "Unable to close INLINE.h after reading: $!\n";
close(RD2) or print "Unable to close expected.h after reading: $!\n";
if(!unlink('INLINE.h')) { print "Couldn't unlink INLINE.h\n"}

print "ok 2\n";

#############################################################################

if(!open(RD1, "CPP.map")) {
  print "not ok 3 - unable to open CPP.map for reading: $!\n";
  exit;
}

if(!open(RD2, "expected_typemap.txt")) {
  print "not ok 3 - unable to open expected_typemap.txt for reading: $!\n";
  exit;
}

@rd1 = <RD1>;
@rd2 = <RD2>;

if(scalar(@rd1) != scalar(@rd2)) {
  print "not ok 3 - CPP.map does not have the expected number of lines\n";
  close(RD1) or print "Unable to close CPP.map after reading: $!\n";
  close(RD2) or print "Unable to close expected_typemap.txt after reading: $!\n";
  exit;
}

for(my $i = 0; $i < scalar(@rd1); $i++) {
   # Try to take care of platform-specific issues with line endings.
   $rd1[$i] =~ s/\n//g;
   $rd2[$i] =~ s/\n//g;
   $rd1[$i] =~ s/\r//g;
   $rd2[$i] =~ s/\r//g;

   if($rd1[$i] ne $rd2[$i]) {
     $ok = 0;
     last;
   }
}

if(!$ok) {
  print "not ok 3 - CPP.map does not match expected_typemap.txt\n";
  close(RD1) or print "Unable to close CPP.map after reading: $!\n";
  close(RD2) or print "Unable to close expected_typemap.txt after reading: $!\n";
  exit;
}

close(RD1) or print "Unable to close CPP.map after reading: $!\n";
close(RD2) or print "Unable to close expected_typemap.txt after reading: $!\n";
if(!unlink('CPP.map')) { print "Couldn't unlink CPP.map\n"}

print "ok 3\n";
