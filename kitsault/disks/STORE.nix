{ ... }:
{
	boot.initrd.luks.devices.store = {
		device = "/dev/disk/by-label/STORE";
		allowDiscards = true;
		keyFileSize = 4096;
		keyFileOffset = 1052688;
		keyFile = "/dev/disk/by-label/KEY";
	};

	fileSystems = {
    		"/store" = {
			device = "/dev/mapper/store";
			fsType = "ext4";
			options = [ "nofail" ];
		};
	};
}
