# Marvell RAID VD Status for SolarWinds N-able™ RMM #
Script for monitoring VD status of Marvell Software RAID Controllers with SolarWinds N-able™ RMM

Requires installed MarvellCLI (Included in Marvell Storage Utility (MSU) https://support.hpe.com/hpesc/public/swd/detail?swItemId=MTX_17d87af242a144cbb3a954352c)

## Usage:
### Parameters:
* -vdid (required) Specifies the Virtual-Disk to be tested.

### Best Practices:
* Create a script-task for every VD you need to test.
* Set maximum execution time to 2 minutes (120 seconds)
