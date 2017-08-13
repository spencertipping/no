#line 6 "no/use.md"
package no {
  BEGIN { ++$INC{'no.pm'} }
  use overload;
}
#line 17 "no/use.md"
sub no::import
{ my $p = caller;
  overload::constant integer => \&no::const::int,
                     float   => \&no::const::float,
                     binary  => \&no::const::binary,
                     q       => \&no::const::q,
                     qr      => \&no::const::qr;
  ${$p::}{$_} = $no::global{$_} for keys %no::global;
  for (keys %no::entry) { ++$INC{"$_.pm"};
                          ${"${_}::"}{unimport} = $no::entry{$_} } }

sub no::unimport
{ my $p = caller;
  overload::remove_constant qw/integer 0 float 0 binary 0 q 0 qr 0/;
  delete ${$p::}{$_} for keys %no::global;
  for (keys %no::entry) { delete $INC{"$_.pm"};
                          delete ${"${_}::"}{unimport} } }
