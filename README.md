# OpenC2X embedded

To build the firmware:

* Update the feeds:
´´´
./scripts/feeds/update -a
./scripts/feeds/install -a
´´´
* Create the configuration:
´´´
./create_configuration.sh x86_64
make defconfig
´´´
* Build
´´´
make
´´´
