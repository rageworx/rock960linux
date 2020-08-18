# Rockchip loader binaries naming rule

## General rules:
* Regardless of the single module or the merged loader, the naming is adopted
    `[chip]_[module]_[feature]_[version].[postfix]`

### chip: 
Chip or chip series name, required option, consistent with the names in all kernel/uboot drivers, specific naming methods are not discussed here, lowercase
### module: 
module name, required options, such as loader, ddr, miniloader, usbplug, bl3x, tee, tee_ta, lowercase

### feature: 
module feature, optional, multiple, such as the frequency used by ddr, or only support a specific ddr, special options of miniloader, etc., lowercase

### version: version information, required option, format is [v1.00,], 0.xx before the official release, after 1.00 after the official release, lowercase
### postfix: 
suffix name, required option, the compiled code is .bin by default, or .elf, merged to .img, lowercase

### The connection symbol uses an underscore "_"
* E.g:
    Files provided by ddr module
    `rk3228_ddr3_800MHz_v1.06.bin`

## Special rules:
1. Naming the merged loader:
    Loader: merged by ddrbin, usbplug and miniloader to form a loader that can be used by the Windows RK upgrade tool;
    ubootloader: combined with ddrbin, usbplug, and U-Boot to form a loader that can be used by the Windows RK upgrade tool;
    idbloader: combined by ddrbin, first-level loader (miniloader or uboot) according to IDB format, directly used to burn the binary in the IDB area;
    Note: The naming of miniloader only refers to the bin compiled and output by the miniloader project, and will no longer be used in the merged loader;
2. The version definition of the merged loader:
    `vx.yy.zzz`
	- v: version means, always use this character, lowercase
	- x.yy: version number of the file provided by ddr, lowercase
	- zzz: [1] is the version number of the file provided by miniloader, minus the dot, lowercase
	- [2] Version number provided by uboot

3. If naming lowercase will cause ambiguity, use uppercase
	Such as ddr GB, cannot be written as gb

### For example:
Name the combined loader:
	`rk3328_loader_v1.03.106.bin`
	- 1.03 is the version number of ddr v1.03
	- 106 is the version number of miniloader v1.06 with the dot removed
