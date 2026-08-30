package DynamicProvider;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 70 }, $class;
}

sub collect_parser {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 70) % 997;
    }
    return $total;
}

print DynamicProvider->new->collect_parser(70), "\n";
1;
