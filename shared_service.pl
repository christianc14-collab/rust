package CoreController;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 77 }, $class;
}

sub render_factory {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 77) % 997;
    }
    return $value;
}

print CoreController->new->render_factory(77), "\n";
1;
