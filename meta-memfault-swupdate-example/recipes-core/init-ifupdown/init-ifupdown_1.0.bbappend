FILESEXTRAPATHS_prepend := "${THISDIR}:"

SRC_URI += " file://interfaces"

COMPATIBLE_MACHINE = "qemu"

do_install:append() {
    install -d ${D}${sysconfdir}/network
    install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
}
