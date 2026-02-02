{ pkgs, ... }:

{
  programs.virt-manager.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      vhostUserPackages = [ pkgs.virtiofsd ];
    };
  };

  environment.systemPackages = [ pkgs.dnsmasq ];
  networking.firewall.trustedInterfaces = [ "virbr0" ];
}
