use ExtUtils::MakeMaker;
WriteMakefile(
    NAME                => 'WWW::Shorten',
    VERSION_FROM        => 'lib/WWW/Shorten.pm',
    PREREQ_PM => {
                'LWP' => '5.75',
                'LWP::UserAgent' => '2.023',
                'URI' => '1.27',
                'Test::More' => '0.47',
            },
    SIGN => 1,
    ($] >= 5.005 ?
      (ABSTRACT_FROM => 'lib/WWW/Shorten.pm',
      AUTHOR     => 'Dave Cross <dave@dave.org.uk>') : ()),
    ( eval($ExtUtils::MakeMaker::VERSION) >= 6.10 ?
        ( NO_META => 1, ) : ()),
);
