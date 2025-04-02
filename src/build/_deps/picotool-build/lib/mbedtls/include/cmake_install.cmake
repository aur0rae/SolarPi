# Install script for directory: /usr/share/pico-sdk/lib/mbedtls/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/aurora/Projects/ESC120/software/build/_deps")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mbedtls" TYPE FILE MESSAGE_NEVER PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/aes.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/aesni.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/arc4.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/aria.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/asn1.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/asn1write.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/base64.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/bignum.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/blowfish.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/bn_mul.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/camellia.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ccm.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/certs.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/chacha20.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/chachapoly.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/check_config.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/cipher.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/cipher_internal.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/cmac.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/compat-1.3.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/config.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/config_psa.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/constant_time.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ctr_drbg.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/debug.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/des.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/dhm.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ecdh.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ecdsa.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ecjpake.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ecp.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ecp_internal.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/entropy.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/entropy_poll.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/error.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/gcm.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/havege.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/hkdf.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/hmac_drbg.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/md.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/md2.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/md4.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/md5.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/md_internal.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/memory_buffer_alloc.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/net.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/net_sockets.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/nist_kw.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/oid.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/padlock.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/pem.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/pk.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/pk_internal.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/pkcs11.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/pkcs12.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/pkcs5.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/platform.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/platform_time.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/platform_util.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/poly1305.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/psa_util.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ripemd160.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/rsa.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/rsa_internal.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/sha1.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/sha256.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/sha512.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ssl.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ssl_cache.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ssl_ciphersuites.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ssl_cookie.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ssl_internal.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/ssl_ticket.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/threading.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/timing.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/version.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/x509.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/x509_crl.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/x509_crt.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/x509_csr.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/mbedtls/xtea.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/psa" TYPE FILE MESSAGE_NEVER PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_builtin_composites.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_builtin_primitives.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_compat.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_config.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_driver_common.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_driver_contexts_composites.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_driver_contexts_primitives.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_extra.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_platform.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_se_driver.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_sizes.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_struct.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_types.h"
    "/usr/share/pico-sdk/lib/mbedtls/include/psa/crypto_values.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/aurora/Projects/ESC120/software/build/_deps/picotool-build/lib/mbedtls/include/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
