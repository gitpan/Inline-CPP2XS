use ExtUtils::MakeMaker;

print "*****************\nThis module is deprecated. Please install the latest version of InlineX::CPP2XS instead\n";
print "*****************\n";

my   %options = %{
  {
  NAME     => 'Inline::CPP2XS',
  PREREQ_PM => {
                'Inline::C'  => 0.44,
                'Inline::CPP' => 0.25,
               },
  VERSION_FROM => 'CPP2XS.pm',
  }
  };

WriteMakefile(%options);
