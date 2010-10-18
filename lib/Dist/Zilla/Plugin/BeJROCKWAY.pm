package Dist::Zilla::Plugin::BeJROCKWAY;
# ABSTRACT: Sets the author/license/copyright year to be me/Perl 5/now
use Moose;
use namespace::autoclean;

with 'Dist::Zilla::Role::Plugin';
use DateTime;

sub BUILD {
    my $self = shift;
    $self->zilla->_global_stashes->{'%Rights'} = bless({
        copyright_holder => 'Jonathan Rockway',
        license_class    => 'Perl_5',
        copyright_year   => DateTime->now->year,
    }, 'Dist::Zilla::Stash::Rights' );

    $self->zilla->_global_stashes->{'%User'} = bless({
        email => 'jrockway@cpan.org',
        name  => 'Jonathan Rockway',
    }, 'Dist::Zilla::Stash::User');
}

__PACKAGE__->meta->make_immutable;

1;
