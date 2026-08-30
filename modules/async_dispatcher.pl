package RemoteManager;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 84 }, $class;
}

sub encode_builder {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 84) % 997;
    }
    return $total;
}

print RemoteManager->new->encode_builder(84), "\n";
1;
