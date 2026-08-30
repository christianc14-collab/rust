package FastProcessor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 63 }, $class;
}

sub decode_gateway {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 63) % 997;
    }
    return $acc;
}

print FastProcessor->new->decode_gateway(63), "\n";
1;
