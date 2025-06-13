# PX30 Release Note

## px30_bl32_v2.19.bin

| Date       | File                | Build commit | Severity  |
| ---------- | :------------------ | ------------ | --------- |
| 2024-10-31 | px30_bl32_v2.19.bin | 9f2aca7d1    | important |

### Fixed

| Index | Severity  | Update                                            | Issue description                                            | Issue source |
| ----- | --------- | ------------------------------------------------- | ------------------------------------------------------------ | ------------ |
| 1     | important | fixed RSA OAEP MGF1 algorithm                     | TA will report an error when using RSA algorithm OAEP MGF1 padding method | -            |
| 2     | important | fixed condition of whether secure boot is enabled | Under unstable hardware conditions, it may be mistakenly believed that secure boot is enabled | -            |

------

## px30_bl32_v2.18.bin

| Date       | File                | Build commit | Severity  |
| ---------- | :------------------ | ------------ | --------- |
| 2024-09-02 | px30_bl32_v2.18.bin | 6c78a7d8c    | important |

### New

1.  Support software TA encryption key, customers can use TA encryption function without burning the key.

------

## px30_ddr_333MHz_v2.11.bin

| Date       | file                      | Build commit | Severity  |
| ---------- | ------------------------- | ------------ | --------- |
| 2024-08-19 | px30_ddr_333MHz_v2.11.bin | 01f75b4      | important |

### Fixed

| Index | Severity  | Update                                                | Issue description                                            | Issue source |
| ----- | --------- | ----------------------------------------------------- | ------------------------------------------------------------ | ------------ |
| 1     | important | Solve the ddr4 power on probability capacity anomaly. | If the power is off and the power is on, the ddr4 probability will lack 1/4 or 1/2 capacity. | -            |

------

## px30_bl32_v2.17.bin

| Date       | File                | Build commit | Severity  |
| ---------- | :------------------ | ------------ | --------- |
| 2024-07-09 | px30_bl32_v2.17.bin | 7ab599eca    | important |

### New

1.  Other security enhancements.
2.  RPMB change read data to multiple times.
3.  Increase MPI_MEMPOOL_SIZE size.

------

## px30_ddr_333MHz_v2.10.bin

| Date       | file                      | Build commit | Severity  |
| ---------- | ------------------------- | ------------ | --------- |
| 2024-05-27 | px30_ddr_333MHz_v2.10.bin | 29a6ff7      | important |

### Fixed

| Index | Severity  | Update                                                    | Issue description                                            | Issue source |
| ----- | --------- | --------------------------------------------------------- | ------------------------------------------------------------ | ------------ |
| 1     | important | Solve the problem of lp3 power-on probability not booting | On and off the power copy machine, lp3 probability does not turn on the problem | -            |

------

## px30_bl32_v2.16.bin

| Date       | File                | Build commit | Severity  |
| ---------- | :------------------ | ------------ | --------- |
| 2024-04-16 | px30_bl32_v2.16.bin | 185dc3c92    | important |

### New

1. Optimization parameter check to enhance security.
2. Support printing TEE memory usage information.
3. Hardware crypto supports addresses exceeding 4G.
4. Support printing FWVER information.

------

## px30_ddr_333MHz_v2.09.bin

| Date       | file                      | Build commit | Severity |
| ---------- | ------------------------- | ------------ | -------- |
| 2023-12-20 | px30_ddr_333MHz_v2.09.bin | 131f35b      | moderate |

### New

1. Add DQS weak pull up/down.

------

## px30_bl31_v1.34.elf

| Date       | file                | Build commit | Severity |
| ---------- | ------------------- | ------------ | -------- |
| 2023-12-26 | px30_bl31_v1.34.elf | 46064b2d5    | moderate |

### New

1. Support DDR Extended temperature range which should used with 2x, 4x refresh rate ddr bin file.

------

## px30_bl32_v2.15.bin

| Date       | File                | Build commit | Severity  |
| ---------- | :------------------ | ------------ | --------- |
| 2023-08-28 | px30_bl32_v2.15.bin | b5340fd65    | important |

### New

1. Support pstore for optee log.
2. Enable dynamic SHM.
3. Support check ta encryption key is written.

------

## px30_{usbplug, miniloader}_v1.37.bin

| Date       | file                                   | Build commit | Severity |
| ---------- | :------------------------------------- | ------------ | -------- |
| 2023-08-01 | px30_{usbplug, miniloader}_v1.37.bin | c949b248     | moderate |

### New

1. Support SLC Nand secure boot.

------

## px30_bl31_v1.33.elf

| Date       | file                | Build commit | Severity  |
| ---------- | :------------------ | ------------ | --------- |
| 2023-02-03 | px30_bl31_v1.33.elf | 0152b20d0    | important |

### New

1. Support AMP.
2. Improve the stability of fiq-debugger.
3. Support pll-deep-mode when system suspend.

------

## px30_ddr_333MHz_v2.08.bin

| Date       | file                      | Build commit | Severity |
| ---------- | ------------------------- | ------------ | -------- |
| 2022-10-27 | px30_ddr_333MHz_v2.08.bin | e5b9702      | moderate |

### New

1. Reserved words for maskrom to add special parameters.

------

## px30_bl31_v1.32.elf

| Date       | file                | Build commit | Severity  |
| ---------- | :------------------ | ------------ | --------- |
| 2022-10-25 | px30_bl31_v1.32.elf | 6f45bba91    | important |

### Fixed

| Index | Severity  | Update                         | Issue description                     | Issue source |
| ----- | --------- | ------------------------------ | ------------------------------------- | ------------ |
| 1     | important | Compatible with the old loader | Boot fail if old loader+new trust.img | -            |

------

## px30_bl32_v2.14.bin

| Date       | File                | Build commit | Severity  |
| ---------- | :------------------ | ------------ | --------- |
| 2022-09-16 | px30_bl32_v2.14.bin | d84087907    | important |

### Fixed

| Index | Severity  | Update                                                       | Issue description                                            | Issue source |
| ----- | --------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------ |
| 1     | important | Solve the problem that OPTEE is stuck during startup when printing is closed | User use /rkbin/tools/ddrbin_tool to close printing ,  then rk_atags will notify OPTEE to disable printing, When OPTEE starts, it will be stuck and unable to enter U-Boot | -            |

------

