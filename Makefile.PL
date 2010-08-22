use inc::Module::Install;
name 'Twist';
all_from 'lib/Twist.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
test_requires 'Test::LoadAllModules';
auto_include;
WriteAll;
