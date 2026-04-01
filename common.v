@[has_globals]
module limine

@[_linker_section: '.limine_requests_start']
@[cinit; markused]
__global volatile limine_requests_start_marker = [
	u64(0xf6b8f4b39de7d1ae),
	0xfab91a6940fcb9cf,
	0x785c6ed015d3e316,
	0x181e920a7852b9d9,
]!

@[_linker_section: '.limine_requests_end']
@[cinit; markused]
__global volatile limine_requests_end_marker = [
	u64(0xadc0e0531bb10d03),
	0x9572709f31764c62,
]!

pub struct BaseRevision {
	id [2]u64 = [u64(0xf9562b2d5c95a6c8), 0x6a7b384944536bdc]!
pub:
	revision u64
}

pub fn (b &BaseRevision) is_supported() bool {
	return b.revision == 0
}

pub fn (b &BaseRevision) is_valid() bool {
	return b.id[1] != 0x6a7b384944536bdc
}

pub fn (b &BaseRevision) loaded_revision() u64 {
	return b.id[1]
}

pub struct Uuid {
pub:
	a u32
	b u16
	c u16
	d [8]u8
}

pub enum MediaType as u32 {
	generic
	optical
	tftp
}

pub struct File {
pub:
	revision        u64
	address         voidptr
	size            u64
	path            &char
	string          &char
	media_type      u32
	unused          u32
	tftp_ip         u32
	tftp_port       u32
	partition_index u32
	mbr_disk_id     u32
	gpt_disk_uuid   Uuid
	gpt_part_uuid   Uuid
	part_uuid       Uuid
}

pub enum FirmwareType as u64 {
	x86bios
	efi32
	efi64
	sbi
}

pub struct VideoMode {
pub:
	pitch            u64
	width            u64
	height           u64
	bpp              u16
	memory_model     u8
	red_mask_size    u8
	red_mask_shift   u8
	green_mask_size  u8
	green_mask_shift u8
	blue_mask_size   u8
	blue_mask_shift  u8
}

pub struct Framebuffer {
pub:
	address          voidptr
	width            u64
	height           u64
	pitch            u64
	bpp              u16
	memory_model     u8
	red_mask_size    u8
	red_mask_shift   u8
	green_mask_size  u8
	green_mask_shift u8
	blue_mask_size   u8
	blue_mask_shift  u8
	unused           [7]u8
	edid_size        u64
	edid             voidptr
	// Response revision 1
	mode_count u64
	modes      &&VideoMode
}

pub const framebuffer_rgb = 1
pub const flanterm_fb_rotate_0 = 0
pub const flanterm_fb_rotate_90 = 1
pub const flanterm_fb_rotate_180 = 2
pub const flanterm_fb_rotate_270 = 3

pub struct FlantermFbInitParams {
pub:
	canvas              &u32
	canvas_size         u64
	ansi_colours        [8]u32
	ansi_bright_colours [8]u32
	default_bg          u32
	default_fg          u32
	default_bg_bright   u32
	default_fg_bright   u32
	font                voidptr
	font_width          u64
	font_height         u64
	font_spacing        u64
	font_scale_x        u64
	font_scale_y        u64
	margin              u64
	rotation            u64
}

$if amd64 || i386 {
	pub const paging_mode_4lvl = 0
	pub const paging_mode_5lvl = 1
	pub const paging_mode_min = paging_mode_4lvl
	pub const paging_mode_default = paging_mode_4lvl
} $else $if arm64 {
	pub const paging_mode_4lvl = 0
	pub const paging_mode_5lvl = 1
	pub const paging_mode_min = paging_mode_4lvl
	pub const paging_mode_default = paging_mode_4lvl
} $else $if rv64 {
	pub const paging_mode_sv39 = 0
	pub const paging_mode_sv48 = 1
	pub const paging_mode_sv57 = 2
	pub const paging_mode_min = paging_mode_sv39
	pub const paging_mode_default = paging_mode_sv48
} $else $if loongarch64 {
	pub const paging_mode_4lvl = 0
	pub const paging_mode_min = paging_mode_4lvl
	pub const paging_mode_default = paging_mode_4lvl
}

pub const mp_request_x86_64_x2apic = 1 << 0
pub const mp_response_x86_64_x2apic = 1 << 0

$if amd64 || i386 {
	pub struct MpInfo {
	pub:
		processor_id   u32
		lapic_id       u32
		reserved       u64
		goto_address   fn (&MpInfo) = unsafe { nil }
		extra_argument u64
	}
} $else $if arm64 {
	pub struct MpInfo {
	pub:
		processor_id   u32
		reserved1      u32
		mpidr          u64
		reserved       u64
		goto_address   fn (&MpInfo) = unsafe { nil }
		extra_argument u64
	}
} $else $if rv64 {
	pub struct MpInfo {
	pub:
		processor_id   u64
		hartid         u64
		reserved       u64
		goto_address   fn (&MpInfo) = unsafe { nil }
		extra_argument u64
	}
} $else $if loongarch64 {
	pub struct MpInfo {
	pub:
		processor_id   u64
		phys_id        u64
		reserved       u64
		goto_address   fn (&MpInfo) = unsafe { nil }
		extra_argument u64
	}
}

pub enum MemmapEntryType as u64 {
	usable
	reserved
	acpi_reclaimable
	acpi_nvs
	bad_memory
	bootloader_reclaimable
	executable_and_modules
	framebuffer
	reserved_mapped
}

pub struct MemmapEntry {
pub:
	base   u64
	length u64
	@type  MemmapEntryType
}

pub const internal_module_required = 1 << 0
pub const internal_module_compressed = 1 << 1

pub struct InternalModule {
pub:
	path   &char
	string &char
	flags  u64
}
