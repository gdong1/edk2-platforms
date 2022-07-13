## @file
# coreboot Package
#
# Provides coreboot specific drivers and definitions to create a platform FV
# to work with UefiPayloadPkg and Universal Payload.
#
# Copyright (c) 2022, Star Labs. All rights reserved.<BR>
# SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                       = corebootPkg
  PLATFORM_GUID                       = 8b2d70f1-b0be-4916-b5f8-80d0bb5c09d3
  PLATFORM_VERSION                    = 0.1
  DSC_SPECIFICATION                   = 0x00010005
  SUPPORTED_ARCHITECTURES             = IA32|X64
  BUILD_TARGETS                       = DEBUG|RELEASE|NOOPT
  SKUID_IDENTIFIER                    = DEFAULT
  OUTPUT_DIRECTORY                    = Build/corebootX64
  FLASH_DEFINITION                    = corebootPkg/corebootPkg.fdf
  PCD_DYNAMIC_AS_DYNAMICEX            = TRUE

[LibraryClasses]
  SmmStoreLib|UefiPayloadPkg/Library/SmmStoreLib/SmmStoreLib.inf
  TpmMeasurementLib|MdeModulePkg/Library/TpmMeasurementLibNull/TpmMeasurementLibNull.inf

[PcdsFixedAtBuild]
  gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvModeEnable|FALSE

[PcdsDynamicExDefault]
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase64|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwWorkingBase64|0
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageFtwSpareBase64|0

[Components.X64]
  UefiPayloadPkg/SmmStoreFvb/SmmStoreFvbRuntimeDxe.inf
  MdeModulePkg/Universal/FaultTolerantWriteDxe/FaultTolerantWriteDxe.inf
  MdeModulePkg/Universal/Variable/RuntimeDxe/VariableRuntimeDxe.inf {
    <LibraryClasses>
      NULL|MdeModulePkg/Library/VarCheckUefiLib/VarCheckUefiLib.inf
      NULL|EmbeddedPkg/Library/NvVarStoreFormattedLib/NvVarStoreFormattedLib.inf
  }

