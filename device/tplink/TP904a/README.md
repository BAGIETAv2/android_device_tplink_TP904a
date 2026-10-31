# TWRP Device Tree for TP-Link Neffos X1 Lite (TP904a)

Custom recovery device tree for building TWRP for **TP-Link Neffos X1 Lite (TP904a / TP904A)**.

## Device Specifications

| Feature | Specification |
|:--- |:--- |
| **Chipset** | MediaTek MT6750 |
| **CPU** | Octa-core (4x1.5 GHz Cortex-A53 & 4x1.0 GHz Cortex-A53) |
| **GPU** | Mali-T860 MP2 |
| **Architecture** | 64-bit (arm64-v8a) |
| **Kernel Version** | 3.18.35+ |
| **Screen Resolution** | 720 x 1280 pixels (~294 ppi / 320 dpi) |
| **Stock OS** | Android 7.0 (Nougat) |
| **Storage** | 16 GB eMMC 5.1 |
| **RAM** | 2 GB LPDDR3 |

## Memory Offsets & Boot Parameters

Extracted from official firmware recovery image:

```text
BOARD_KERNEL_BASE       := 0x40078000
BOARD_KERNEL_PAGESIZE   := 2048
BOARD_KERNEL_OFFSET     := 0x00008000 (kernel_addr: 0x40080000)
BOARD_RAMDISK_OFFSET    := 0x04f88000 (ramdisk_addr: 0x45000000)
BOARD_SECOND_OFFSET     := 0x00e88000 (second_addr: 0x40f00000)
BOARD_TAGS_OFFSET       := 0x03f88000 (tags_addr: 0x44000000)
BOARD_KERNEL_CMDLINE    := bootopt=64S3,32N2,64N2
```

## Critical Partition Safeguards

To prevent permanent loss of IMEI numbers and baseband calibration on MediaTek devices:
- `/nvram` (`flags=display="NVRAM";backup=1;wipeingui=0`)
- `/nvdata` (`flags=display="NVData";backup=1;wipeingui=0`)
- `/protect_f` (`flags=display="Protect_F";backup=1;wipeingui=0`)
- `/protect_s` (`flags=display="Protect_S";backup=1;wipeingui=0`)
- `/proinfo` (`flags=display="Proinfo";backup=1;wipeingui=0`)
- `/frp` (`flags=display="FRP";backup=1;wipeingui=0`)

All critical calibration and identification partitions are excluded from GUI wiping actions (`wipeingui=0`).
