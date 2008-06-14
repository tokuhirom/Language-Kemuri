package Language::Kemuri;
use strict;
use warnings;
use Carp;
our $VERSION = '0.06';
use Exporter;
use Switch;
our @EXPORT_OK = qw/kemuri/;

sub kemuri {
    my $code = shift;

    my @stack;
    my $buf = "";
    
    for my $c ( split //, $code ) {
        switch ($c) {
            case '`' {
                push @stack, unpack("C*", reverse "Hello, world!");
            }
            case '"' {
                my $x = pop @stack;
                push @stack, $x;
                push @stack, $x;
            }
            case "'" {
                my $x = pop @stack;
                my $y = pop @stack;
                my $z = pop @stack;
                push @stack, $x;
                push @stack, $z;
                push @stack, $y;
            }
            case '^' {
                my $x = pop @stack;
                my $y = pop @stack;
                push @stack, $x ^ $y;
            }
            case '~' {
                my $x = pop @stack;
                push @stack, -($x+1);
            }
            case '|' {
                $buf .= reverse map { chr($_ % 256) } @stack;
            }
            else {
                croak "unknown kemuri token $c in $code";
            }
        }
    }

    return $buf;
}

1;
__END__

=head1 NAME

Language::Kemuri - Kemuri Interpreter.

=head1 SYNOPSIS

    use Language::Kemuri;
    kemuri('`|'); # => Hello, world!

=head1 DESCRIPTION

An interpreter for Kemuri language.

=head1 METHODS

=head2 kemuri

run the kemuri, and return the output value.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

=head1 AUTHOR

Tokuhiro Matsuno  C<< <tokuhiro __at__ mobilefactory.jp> >>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2007, Tokuhiro Matsuno C<< <tokuhiro __at__ mobilefactory.jp> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

