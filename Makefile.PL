use inc::Module::Install;

name            'Language-Kemuri';
all_from        'lib/Language/Kemuri.pm';

requires 'Switch';

author_tests 'xt';
use_test_base;
auto_install;
WriteAll;

