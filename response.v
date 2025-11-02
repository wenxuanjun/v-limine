module limine

pub struct BootloaderInfoResponse {
pub:
	revision u64
	name     charptr
	version  charptr
}

pub struct ExecutableCmdlineResponse {
pub:
	revision u64
	cmdline  charptr
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

pub struct PagingModeResponse {
pub:
	revision u64
	mode     u64
}

pub struct MpResponse {
pub:
	revision     u64
	flags        u32
	bsp_lapic_id u32
	cpu_count    u64
	cpus         &&MpInfo
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
	revision u64
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
	entry_32 u64
	entry_64 u64
}

pub struct EfiSystemTableResponse {
pub:
	revision u64
	address  u64
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
	revision u64
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
