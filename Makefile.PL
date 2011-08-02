use inc::Module::Install;
name 'ATND-Lite';
all_from 'lib/ATND/Lite.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
