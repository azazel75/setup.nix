{ pkgs, pythonPackages, make-test, build, ... }:

make-test ({ pkgs, ... }: {
  name = "test";
  machine = { config, pkgs, lib, ... }: {
    environment.systemPackages = [ build ];
  };
  testScript = ''
    $machine->waitForUnit("multi-user.target");
    print STDERR $machine->succeed("hello-world");
  '';
})
