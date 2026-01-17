use 5.010;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Janitor',
    AUTHOR           => q{joelwizard},
    VERSION_FROM     => 'lib/Janitor.pm',
    ABSTRACT         => 'Smart filesystem cleanup tool with duplicate detection and size analysis',
    LICENSE          => 'perl_5',
    MIN_PERL_VERSION => '5.010',
    
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '6.64',
    },
    
    BUILD_REQUIRES => {
        'Test::More'      => '0.98',
        'Test::Exception' => '0.43',
        'Test::Deep'      => '1.120',
    },
    
    PREREQ_PM => {
        # Core dependencies
        'Moose'                  => '2.2011',
        'MooseX::Getopt'        => '0.75',
        'namespace::autoclean'   => '0.28',
        
        # Configuration
        'YAML::XS'              => '0.81',
        'Config::Any'           => '0.32',
        
        # File operations
        'File::Find::Rule'      => '0.34',
        'File::Spec'            => '3.75',
        'Path::Tiny'            => '0.118',
        'File::Copy::Recursive' => '0.45',
        
        # Checksums for duplicate detection
        'Digest::MD5'           => '2.55',
        'Digest::SHA'           => '6.02',
        
        # CLI interface
        'Term::ANSIColor'       => '5.01',
        'Term::ProgressBar'     => '2.22',
        'Text::Table'           => '1.133',
        
        # Logging
        'Log::Log4perl'         => '1.49',
        
        # Date/Time
        'DateTime'              => '1.54',
        'Time::HiRes'           => '1.9764',
        
        # Utilities
        'List::Util'            => '1.50',
        'Scalar::Util'          => '1.50',
        'Try::Tiny'             => '0.30',
        'Readonly'              => '2.05',
    },
    
    EXE_FILES => [
        'bin/fs-cleaner',
        'bin/fs-analyze',
        'bin/fs-duplicates',
    ],
    
    dist  => { 
        COMPRESS => 'gzip -9f', 
        SUFFIX   => 'gz',
    },
    
    clean => { 
        FILES => 'Janitor-* *.tar.gz' 
    },
    
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources   => {
            repository => {
                type => 'git',
                url  => 'https://github.com/joelwizard404/janitor.git',
                web  => 'https://github.com/joelwizard404/janitor',
            },
            bugtracker => {
                web => 'https://github.com/joelwizard404/janitor/issues',
            },
            homepage => 'https://github.com/joelwizard404/janitor',
        },
    },
);

# Create necessary directories if they don't exist
sub MY::postamble {
    return <<'MAKE_FRAG';
install ::
	@echo "Installing Janitor..."
	@mkdir -p $(DESTDIR)$(PREFIX)/share/janitor/config
	@cp -r config/* $(DESTDIR)$(PREFIX)/share/janitor/config/ 2>/dev/null || true
	@echo "Installation complete!"

test_verbose ::
	prove -lv t/

test_coverage ::
	cover -test -report html

clean_quarantine ::
	@echo "Cleaning quarantine directories..."
	@rm -rf ~/.janitor/quarantine/*

MAKE_FRAG
}
