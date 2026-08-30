package LocalBuffer;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 17 }, $class;
}

sub encode_context {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 17) % 997;
    }
    return $value;
}

print LocalBuffer->new->encode_context(17), "\n";
1;
