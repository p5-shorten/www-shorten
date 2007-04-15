use Module::Build;

my $build = Module::Build->new(
			       module_name => 'WWW::Shorten',
			       license     => 'perl',
			       requires    => {
					       'LWP' => '5.75',
					       'LWP::UserAgent' => '2.023',
					       'URI' => '1.27',
					      },
			       build_requires => {
						  'Test::More' => '0.47',
						 },
			       create_makefile_pl => 'traditional',
);

$build->create_build_script;
