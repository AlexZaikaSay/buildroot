#!/bin/sh
set -eu

BOARD_DIR="$(dirname "$0")"

# Kernel is built without devpts support
sed -i '/^devpts/d' "${TARGET_DIR}"/etc/fstab

install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf


# # Add a console on ttySTM0
# if [ -e ${TARGET_DIR}/etc/inittab ]; then
# 	# Remove default generic console getty entry.
# 	sed -i '/^console::respawn:/d' ${TARGET_DIR}/etc/inittab
# 	grep -qE '^ttySTM0::' ${TARGET_DIR}/etc/inittab || \
# 		sed -i '/GENERIC_SERIAL/a\
# ttySTM0::respawn:/sbin/getty -L ttySTM0 115200 vt100' ${TARGET_DIR}/etc/inittab
# fi