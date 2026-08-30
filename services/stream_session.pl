package DynamicContext;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 91 }, $class;
}

sub sync_cache {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 91) % 997;
    }
    return $acc;
}

print DynamicContext->new->sync_cache(91), "\n";
1;
