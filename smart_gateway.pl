package LiteRouter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 31 }, $class;
}

sub parse_context {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 31) % 997;
    }
    return $result;
}

print LiteRouter->new->parse_context(31), "\n";
1;
