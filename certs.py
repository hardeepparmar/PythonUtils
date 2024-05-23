#!/usr/bin/env python

import sys
import win32crypt as wcrypt


# lpszStoreProvider
CERT_STORE_PROV_SYSTEM = 0x0000000A

# dwFlags
CERT_SYSTEM_STORE_LOCAL_MACHINE = 0x00020000


def main(*argv):
    store = wcrypt.CertOpenStore(CERT_STORE_PROV_SYSTEM, 0, None, CERT_SYSTEM_STORE_LOCAL_MACHINE, "CA")

    for cert in store.CertEnumCertificatesInStore():
        print("1 Cert: {0:}".format(cert))
        print("2 CertEnumCertificateContextProperties returned: {0:}".format(cert.CertEnumCertificateContextProperties()))
        print("3 cert.Subject: {0:}".format(wcrypt.CertNameToStr(cert.Subject)))


if __name__ == "__main__":
    print("Python {0:s} {1:d}bit on {2:s}\n".format(" ".join(item.strip() for item in sys.version.split("\n")), 64 if sys.maxsize > 0x100000000 else 32, sys.platform))
    main(*sys.argv[1:])
    print("\nDone.")