#! /bin/bash 

cd buildroot 
echo Setting up Base Buildroot Environment... 
make defconfig BR2_DEFCONFIG=../nuc_configs/nuvoton_nuc980_iot_defconfig 
mkdir buildroot/output
mkdir buildroot/output/build/
mkdir buildroot/output/build/image
