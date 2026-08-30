package AsyncEngine;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 89 }, $class;
}

sub run_loader {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 89) % 997;
    }
    return $value;
}

print AsyncEngine->new->run_loader(89), "\n";
1;
