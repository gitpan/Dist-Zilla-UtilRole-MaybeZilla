
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.4203"
  },
  "configure_requires" => {
    "Module::Build" => "0.4203"
  },
  "dist_abstract" => "Soft-dependency on Dist::Zilla for Utilities.",
  "dist_author" => [
    "Kent Fredric <kentfredric\@gmail.com>"
  ],
  "dist_name" => "Dist-Zilla-UtilRole-MaybeZilla",
  "dist_version" => "0.001000",
  "license" => "perl",
  "module_name" => "Dist::Zilla::UtilRole::MaybeZilla",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Log::Contextual::LogDispatchouli" => 0,
    "Moose::Role" => 0,
    "Scalar::Util" => 0,
    "namespace::autoclean" => 0,
    "perl" => "5.006",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Capture::Tiny" => 0,
    "Log::Dispatchouli" => 0,
    "Moose" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "1.001002"
  }
);


my %fallback_build_requires = (
  "Capture::Tiny" => 0,
  "Log::Dispatchouli" => 0,
  "Module::Build" => "0.4203",
  "Moose" => 0,
  "Test::Fatal" => 0,
  "Test::More" => "1.001002"
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  delete $module_build_args{test_requires};
  $module_build_args{build_requires} = \%fallback_build_requires;
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
