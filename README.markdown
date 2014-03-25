
Welcome to the unofficial zfs-crypto branch.

To make it clear, this branch has nothing to do with Sun, Oracle,
ZFSOnLinux, OpenSolaris, IllumOS, OpenIndiana, SmartOS,OpenZFSonOSX and
FreeBSD etc.

If you run a legacy pool version=30, this branch will let you
import and upgrade your pool to the standard pool version=5000,
and it will set feature@encryption for any filesystem using
encryption.

It is to aid those who happen to use zfs-crypto with pool version=30
for the short window that it was available. Before the feature@
pool version became standard, or when importing pools from Solaris.

The original project without crypto support is available here;
https://github.com/openzfsonosx/zfs


** zfs.kext depends upon spl.kext, so start with that repository:
https://github.com/openzfsonosx/spl.git

It is tested primarily on Mac OS X Mavericks.


Please note that 'llvm-gcc' or 'clang' should be used for compiling the KEXTs.
Pure 'gcc' will produce unstable builds.

```
 # ./configure CC=clang CXX=clang++
or
 # ./configure CC=llvm-gcc CXX=llvm-g++
```


There are new files,

zcrypt.c
zcrypt.h
zio_crypt.c
zio_crypt.h
dsl_crypto.c
dsl_crypto.h
libzfs_crypto.c
zcrypt_common.c

which are kept "as is" as much as possible, including (possibly
irrelevant) headers.

The crypto/api/ header files are from OpenSolaris.

The crypto/api implementation is brand new, and supports "bare
minimum" features as needed by ZFS only.

Importing a Solaris pool can be done using:
 Solaris: zpool create -o version=30 -O version=5 thepool $devices...
 Solaris: zfs create -o encryption=aes-256-ccm thepool/secure
 Linux: zpool import -N thepool
 Linux: zpool upgrade thepool
 Linux: zfs mount thepool/secure


* MACs are in use, but compute_mac() is empty, not called?

* All "// FIXME" should be inspected. In particular, known areas
  which differ are PROP_ALIAS, PROP_INHERIT, crypto vs userquota,

* Removed KEY methods "https URI" (requires curl) and pkcs11 types.

```
Example 1: Ask for password.
============================
# zfs create -o encryption=aes-256-gcm mypool/BOOM
  Enter passphrase for 'mypool/BOOM':
  Enter again:
  kernel: [11266.250594] spl-crypto: Cipher test 'CKM_AES_CCM' -> 'sun-ccm(aes)' successful.
# zfs list
  NAME          USED  AVAIL  REFER  MOUNTPOINT
  mypool        142K   984M    31K  /mypool
  mypool/BOOM    31K   984M    31K  /mypool/BOOM

# zpool get all mypool

mypool  feature@async_destroy  enabled                local
mypool  feature@encryption     active                 local
```

-- rogue

