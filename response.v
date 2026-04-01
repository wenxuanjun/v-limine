module limine

pub struct BootloaderInfoResponse {
pub:
	revision u64
	name     &char
	version  &char
}

pub struct ExecutableCmdlineResponse {
pub:
	revision u64
	cmdline  &char
}

pub struct FirmwareTypeResponse {
pub:
	revision      u64
	firmware_type FirmwareType
}

pub struct StackSizeResponse {
pub:
	revision u64
}

pub struct HhdmResponse {
pub:
	revision u64
	offset   u64
}

pub struct FramebufferResponse {
pub:
	revision          u64
	framebuffer_count u64
	framebuffers      &&Framebuffer
}

pub struct FlantermFbInitParamsResponse {
pub:
	revision    u64
	entry_count u64
	entries     &&FlantermFbInitParams
}

pub struct PagingModeResponse {
pub:
	revision u64
	mode     u64
}

$if amd64 || i386 {
	pub struct MpResponse {
	pub:
		revision     u64
		flags        u32
		bsp_lapic_id u32
		cpu_count    u64
		cpus         &&MpInfo
	}
} $else $if arm64 {
	pub struct MpResponse {
	pub:
		revision  u64
		flags     u64
		bsp_mpidr u64
		cpu_count u64
		cpus      &&MpInfo
	}
} $else $if rv64 {
	pub struct MpResponse {
	pub:
		revision   u64
		flags      u64
		bsp_hartid u64
		cpu_count  u64
		cpus       &&MpInfo
	}
} $else $if loongarch64 {
	pub struct MpResponse {
	pub:
		revision    u64
		flags       u64
		bsp_phys_id u64
		cpu_count   u64
		cpus        &&MpInfo
	}
}

pub struct MemmapResponse {
pub:
	revision    u64
	entry_count u64
	entries     &&MemmapEntry
}

pub struct EntryPointResponse {
pub:
	revision u64
}

pub struct ExecutableFileResponse {
pub:
	revision        u64
	executable_file &File
}

pub struct ModuleResponse {
pub:
	revision     u64
	module_count u64
	modules      &&File
}

pub struct RsdpResponse {
pub:
	revision u64
	address  voidptr
}

pub struct SmbiosResponse {
pub:
	revision u64
	entry_32 voidptr
	entry_64 voidptr
}

pub struct EfiSystemTableResponse {
pub:
	revision u64
	address  voidptr
}

pub struct EfiMemmapResponse {
pub:
	revision     u64
	memmap       voidptr
	memmap_size  u64
	desc_size    u64
	desc_version u64
}

pub struct DateAtBootResponse {
pub:
	revision  u64
	timestamp i64
}

pub struct ExecutableAddressResponse {
pub:
	revision      u64
	physical_base u64
	virtual_base  u64
}

pub struct DtbResponse {
pub:
	revision u64
	dtb_ptr  voidptr
}

pub struct RiscvBspHartidResponse {
pub:
	revision   u64
	bsp_hartid u64
}

pub struct BootloaderPerformanceResponse {
pub:
	revision   u64
	reset_usec u64
	init_usec  u64
	exec_usec  u64
}

pub struct KeepIommuResponse {
pub:
	revision u64
}
