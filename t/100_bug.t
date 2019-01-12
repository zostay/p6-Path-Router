#!/usr/bin/perl6

use v6;

use Test;
use Test::Path::Router;
use Path::Router;

my $router = Path::Router.new;

$router.add-route('/wiki/?:page' => %(
    defaults => {
        controller => 'wiki',
        page       => 'HomePage',
    }
));

$router.add-route('/css/:style' => %(
    defaults => {
        controller => 'css'
    }
));

is(
    $router.path-for(page => 'whatever'),
    'wiki/whatever',
    '... got the right URI'
);

is(
    $router.path-for(style => 'mystyle'),
    'css/mystyle',
    '... got the right URI'
);

is(
    $router.path-for(style => 'wiki'),
    'css/wiki',
    '... got the right URI'
);

is(
    $router.path-for(controller => 'wiki'),
    'wiki',
    'defaults correctly excluded (no trailing slash)',
);

done-testing;
