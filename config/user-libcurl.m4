dnl #
<<<<<<< HEAD
dnl # Check for libcurl
=======
dnl # Check for zlib
>>>>>>> b355bb8ea992ad73d788fcb9dac961f901f91468
dnl #
AC_DEFUN([ZFS_AC_CONFIG_LIBCURL], [
	LIBCURL=

<<<<<<< HEAD
	AC_CHECK_HEADER([curl/curl.h], [], [AC_MSG_FAILURE([
	*** curl/curl.h missing, libcurl-devel package required])])

	AC_CHECK_LIB([curl], [curl_easy_init], [], [AC_MSG_FAILURE([
	*** curl_easy_init() missing, libcurl-devel package required])])

	AC_CHECK_LIB([curl], [curl_easy_setopt], [], [AC_MSG_FAILURE([
	*** curl_easy_setopt() missing, libcurl-devel package required])])

	AC_SUBST([LIBCURL], ["-lcurl"])
=======
	#AC_CHECK_HEADER([zlib.h], [], [AC_MSG_FAILURE([
	#*** zlib.h missing, zlib-devel package required])])

	#AC_CHECK_LIB([z], [compress2], [], [AC_MSG_FAILURE([
	#*** compress2() missing, zlib-devel package required])])

	#AC_CHECK_LIB([z], [uncompress], [], [AC_MSG_FAILURE([
	#*** uncompress() missing, zlib-devel package required])])

	#AC_CHECK_LIB([z], [crc32], [], [AC_MSG_FAILURE([
	#*** crc32() missing, zlib-devel package required])])

    #	AC_SUBST([ZLIB], ["-lz"])
>>>>>>> b355bb8ea992ad73d788fcb9dac961f901f91468
	AC_DEFINE([HAVE_LIBCURL], 1, [Define if you have libcurl])
])
