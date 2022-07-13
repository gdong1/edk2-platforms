/** @file
  Coreboot PEI module include file.

  Copyright (c) 2014 - 2015, Intel Corporation. All rights reserved.<BR>
  SPDX-License-Identifier: BSD-2-Clause-Patent

**/

#define CB_TAG_SMMSTOREV2  0x0039
struct cb_smmstorev2 {
  UINT32    tag;
  UINT32    size;
  UINT32    num_blocks;      /* Number of writeable blocks in Smm */
  UINT32    block_size;      /* Size of a block in byte. Default: 64 KiB */
  UINT32    mmap_addr;       /* MMIO address of the store for read only access */
  UINT32    com_buffer;      /* Physical address of the communication buffer */
  UINT32    com_buffer_size; /* Size of the communication buffer in byte */
  UINT8     apm_cmd;         /* The command byte to write to the APM I/O port */
  UINT8     unused[3];       /* Set to zero */
};
