# Ubuntu on NUC8 (Hades Canyon)

Setting up Ubuntu wasn't completely straightforward for me; here are the steps I had to follow.

## Hardware Setup
My hardware is as follows:
* nuc8i7hnk (the lower-power i7)
* 2 x crucial 16GB SODIMM
* 2 x 1TB Samsung Evo 970 NVMe

## BIOS Settings

We need to disable settings that linux can't work with
* Under Advanced/Devices/SATA, leave drives in AHCI mode
* Under Advanced/Performance/Graphics, Disable Intel iGD 

Bonus: Ubuntu colors for the Skull LED Controls:
* Purple: R:119, G:41, B:83
* Orange: R:233, G:84, B:32

## Install Ubuntu

In my case, I want to set aside partitions, one for RAID 1 (the system) and the other RAID 0 (for fast data access)

* Download the Ubuntu Desktop 18.10 iso and burn to a USB thumb drive (I used Balena Etcher on MacOS)
* Boot from USB and run installer
* During Partitioning step, choose "Other" to manually set up partitioning
  - Ensure both drives are unpartitioned
  - set first partition @ 200MB as type "EFI" (required for boot)
  - set next partition @ 327GB as type "ext4" (system)
  - set next partition @ 500GB as type "ext4" (data)
  - set next partition @ 64GB as type "linux-swap" (ie 2x the RAM)
  - Do not partition the second drive, as the ubuntu installer may install to the second disk. Who knows??
* complete installation

## Configure Ubuntu

### Configure Swap
* TODO

### Configure RAID

* Run `gparted` and mirror the partition settings from the first disk.
* Install + run `mdadm` to set up a RAID0 partition.. see Creating a RAID 0 array @ https://www.digitalocean.com/community/tutorials/how-to-create-raid-arrays-with-mdadm-on-ubuntu-16-04
* TODO: Still need to figure out how to set up raid1 for main drive

### Configure PulseAudio
Sound quality out of the box is not very good.
The tweaks I made can be found in this repo under `./linux_root_fs`

### Configure Xbox Controllers
XBox controllers aren't supported out of the box it seems.

* For XBOX controllers in steam, have to follow guide as per https://www.reddit.com/r/linux_gaming/comments/3x4td3/xboxdrv_with_two_controllers/ ... this also looks good https://github.com/xboxdrv/xboxdrv/issues/38
* TODO: Persistent setup (cron?)
