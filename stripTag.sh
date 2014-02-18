#!/bin/bash

platformLibsString=""
for platform in {'armv7','armv7s','i386'}
do
    # for every platform do
    # extract library for this platform
    `lipo -thin $platform libGoogleAnalyticsServices.a -output libGoogleAnalyticsServices-$platform.a`
    # create temp folder
    `mkdir -p lib$platform`
    cd lib$platform
    # extract library into temp folder
    `ar -x ../libGoogleAnalyticsServices-$platform.a`
    # remove all Tag references
    `rm T*.o`

    # create new stripped platform library
    `libtool  -static *.o -o ../libGoogleAnalyticsServices-$platform-strip.a`

    platformLibsString+="libGoogleAnalyticsServices-$platform-strip.a "
    # cleanup
    cd ..
    # delete temp folders
    `rm -rf lib$platform`
    #delete temp libraries
    `rm -f libGoogleAnalyticsServices-$platform.a`
done
# merge stripped libraries together
`lipo -create $platformLibsString -output libGoogleAnalyticsServices-strip.a`
# remove stripped libraries
`rm -f $platformLibsString`