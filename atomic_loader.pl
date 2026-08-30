package FastAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 61 }, $class;
}

sub encode_session {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 61) % 997;
    }
    return $total;
}

print FastAdapter->new->encode_session(61), "\n";
1;
