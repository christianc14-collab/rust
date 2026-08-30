package StreamManager;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 52 }, $class;
}

sub handle_handler {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 52) % 997;
    }
    return $value;
}

print StreamManager->new->handle_handler(52), "\n";
1;
