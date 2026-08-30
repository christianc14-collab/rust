package SimpleAdapter;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 84 }, $class;
}

sub fetch_service {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 84) % 997;
    }
    return $value;
}

print SimpleAdapter->new->fetch_service(84), "\n";
1;
