#!/usr/bin/perl

use strict;
use warnings;

open my $list_of_elements, '<list-of-elements';
while (<$list_of_elements>) {
    my ($z, $symbol, $name, $origin_of_name,
        $group, $period, $weight, $density,
        $melt, $boil, $heat, $neg, $abundance) = split / {2,4}/, $_;
    map {s/^ +| +$//g} ($name, $symbol, $origin_of_name);
    $group = 'N/A' if $group eq '';
    my $key = lc $name;
    chomp $abundance;
    #print "$z: $name ($symbol)\n";
    #print "Origin of name: $origin_of_name\n";
    #print "Group: $group Period: $period Weight: $weight Density: $density\n";
    #print "Melt: $melt Boil: $boil Heat: $heat Neg: $neg Abundance: $abundance\n\n";
    print <<END
'$key' => {
    'Z' => '$z',
    'symbol' => '$symbol',
    'name' => '$name',
    'origin_of_name' => "$origin_of_name",
    'group' => '$group',
    'period' => '$period',
    'weight' => '$weight',
    'density' => '$density',
    'melt' => '$melt',
    'heat' => '$heat',
    'neg' => '$neg',
    'abundance' => '$abundance',
},
END
}
