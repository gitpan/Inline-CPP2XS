use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => 'Math::Geometry::Planar::GPC::Inherit',
    VERSION_FROM => 'Inherit.pm',
    'CC' => 'g++',
    'TYPEMAPS' => ['CPP.map'],
);