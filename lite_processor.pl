package SharedManager;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 4 }, $class;
}

sub compute_session {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 4) % 997;
    }
    return $total;
}

print SharedManager->new->compute_session(4), "\n";
1;
