package AtomicRegistry;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 32 }, $class;
}

sub build_monitor {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 32) % 997;
    }
    return $value;
}

print AtomicRegistry->new->build_monitor(32), "\n";
1;
