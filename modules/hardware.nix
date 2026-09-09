{ pkgs, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;
  boot.kernelModules = ["kvm-intel"];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vulkan-tools
      vulkan-validation-layers
    ];
  };

  boot.initrd.kernelModules = ["amdgpu"];
  hardware.uinput.enable = true; # gamepad support
}
