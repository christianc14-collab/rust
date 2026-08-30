package HybridBuilder;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 49 }, $class;
}

sub parse_gateway {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 49) % 997;
    }
    return $result;
}

print HybridBuilder->new->parse_gateway(49), "\n";
1;
