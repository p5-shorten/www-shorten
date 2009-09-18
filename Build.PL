use Module::Build;

my $build = Module::Build->new(
			       module_name => 'WWW::Shorten',
                               dist_version => '2.05',
			       license     => 'perl',
			       requires    => {
                                 'perl'                => '5.006',
                                 'LWP'                 => '5.75',
                                 'LWP::UserAgent'      => '2.023',
                                 'URI'                 => '1.27',
                               },
			       build_requires => {
                                 'Test::More'          => '0.47',
                               },
                               build_recommends => {
                                 'Test::Pod'           => 0,
                                 'Test::Pod::Coverage' => 0,
                                 'Test::Signature'     => 0,
                               },               
			       create_makefile_pl => 'traditional',
                               script_files       => [ 'bin/shorten' ],
);

$build->create_build_script;
