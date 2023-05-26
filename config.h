#pragma once

//////////////
/// Common POSIX defs

#if !defined(HAVE_ISTREAM) && __has_include(<istream>)
  #define HAVE_ISTREAM 1
#endif

#if !defined(HAVE_OSTREAM) && __has_include(<ostream>)
  #define HAVE_OSTREAM 1
#endif

#if !defined(HAVE_SSTREAM) && __has_include(<sstream>)
  #define HAVE_SSTREAM 1
#endif

#if !defined(HAVE_INTTYPES_H) && __has_include(<inttypes.h>)
  #define HAVE_INTTYPES_H 1
#endif

#if !defined(HAVE_LOCALE_H) && __has_include(<locale.h>)
  #define HAVE_LOCALE_H 1
#endif

#if !defined(HAVE_MEMORY_H) && __has_include(<memory.h>)
  #define HAVE_MEMORY_H 1
#endif

#if !defined(HAVE_STDLIB_H) && __has_include(<stdlib.h>)
  #define HAVE_STDLIB_H 1
#endif

#if !defined(HAVE_STRINGS_H) && __has_include(<strings.h>)
  #define HAVE_STRINGS_H 1
#endif

#if !defined(HAVE_STRING_H) && __has_include(<string.h>)
  #define HAVE_STRING_H 1
#endif

#if !defined(HAVE_SYS_SELECT_H) && __has_include(<sys/select.h>)
  #define HAVE_SYS_SELECT_H 1
#endif

#if !defined(HAVE_SYS_SOCKET_H) && __has_include(<sys/socket.h>)
  #define HAVE_SYS_SOCKET_H 1
#endif

#if !defined(HAVE_SYS_STAT_H) && __has_include(<sys/stat.h>)
  #define HAVE_SYS_STAT_H 1
#endif

#if !defined(HAVE_SYS_TIME_H) && __has_include(<sys/time.h>)
  #define HAVE_SYS_TIME_H 1
#endif

#if !defined(HAVE_SYS_UTSNAME_H) && __has_include(<sys/utsname.h>)
  #define HAVE_SYS_UTSNAME_H 1
#endif

#if !defined(HAVE_UNISTD_H) && __has_include(<unistd.h>)
  #define HAVE_UNISTD_H 1
#endif

#if !defined(HAVE_WCHAR_H) && __has_include(<wchar.h>)
  #define HAVE_WCHAR_H 1
#endif

#ifndef HAVE_GETPWUID_R // getpwuid_r
  #define HAVE_GETPWUID_R 1
#endif

#ifndef HAVE_GMTIME_R // gmtime_r
  #define HAVE_GMTIME_R 1
#endif

#ifndef HAVE_NANOSLEEP // nanosleep
  #define HAVE_NANOSLEEP 1
#endif

// #ifndef HAVE_POLL // poll
//   #define HAVE_POLL 1
// #endif

#ifndef HAVE_POSIX_SIGWAIT // sigwait
  #define HAVE_POSIX_SIGWAIT 1
#endif

#ifndef HAVE_STRFTIME // strftime
  #define HAVE_STRFTIME 1
#endif

#ifndef HAVE_VSNPRINTF // vsnprintf
  #define HAVE_VSNPRINTF 1
#endif

#ifndef HAVE_INET_ATON // inet_aton
  #define HAVE_INET_ATON 1
#endif

#ifndef HAVE_PTHREAD
  #define HAVE_PTHREAD 1
#endif

#ifndef HAVE_PTHREAD_SIGNAL
  #define HAVE_PTHREAD_SIGNAL 1
#endif

#ifndef SELECT_TYPE_ARG1
  #define SELECT_TYPE_ARG1 int
#endif

#ifndef SELECT_TYPE_ARG234
  #define SELECT_TYPE_ARG234 (fd_set *)
#endif

#ifndef SELECT_TYPE_ARG5
  #define SELECT_TYPE_ARG5 (struct timeval *)
#endif

#ifndef TIME_WITH_SYS_TIME
  #define TIME_WITH_SYS_TIME 1
#endif

#ifndef HAVE_SOCKLEN_T
  #define HAVE_SOCKLEN_T 1
#endif



#if defined __APPLE__
#elif defined __linux__
#endif
