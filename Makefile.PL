use inc::Module::Install;

name            'Language-Kemuri';
all_from        'lib/Language/Kemuri.pm';

requires 'Switch';

use_test_base;
auto_install;
WriteAll;

