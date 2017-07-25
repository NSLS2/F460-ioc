F460 EPICS Driver
=================

StreamDevice-based EPICS support for the FMB Oxford F460 four-channel 
fast current measurement device.

Requirements
------------

Though it may work on other versions, the driver was tested on these:

1. EPICS base 3.14.12.3 http://www.aps.anl.gov/epics/
2. asyn 4-21 http://www.aps.anl.gov/epics/modules/soft/asyn/
3. StreamDevice 2.6 http://epics.web.psi.ch/software/streamdevice/

A newer StreamDevice may be required than the NSLS-II Debian package has (as of early 2013).
If included in $(TOP)/StreamDevice, it will be built automatically.
The newer StreamDevice also requires a newer asyn (>= 4-18).

Optional
--------

1. CSS-NSLS2 download: http://cs-studio.sourceforge.net/nsls2/nsls2.html
   OPI screens are provided in $TOP/opi for CSS/BOY. 
   Import these into your css-workspace and set the macros to match the
   IOC settings.

Installation
------------

1. Install EPICS
    1. If using a Debian-based system (e.g., Ubuntu), use the packages here http://epics.nsls2.bnl.gov/debian/
    2. If no packages are available for your distribution, build from source
2. Edit configure/RELEASE
    1. Point the directories listed in there to the appropriate places
    2. If using the Debian packages, everything can be pointed to /usr/lib/epics
3. Edit iocBoot/iocf460/st.cmd
    1. Change the shebang on the top of the script if your architecture is different than linux-x86:
        #!../../bin/linux-x86/f460
        (check if the environment variable EPICS_HOST_ARCH is set, or perhaps `uname -a`, or 
        after running `make` see what was built in $TOP/bin)
    2. The following line sets the prefix to all of your F460 PVs:
        epicsEnvSet("P", "E1:F460:")
       Set the second quoted string appropriately according to your facility's naming standards.
    3. The following line sets the IP address of the serial device server communicating with the F460:
        drvAsynIPPortConfigure("$(PORT)", "10.0.0.11:4001")
       Change the 10.0.0.11 to the IP address, and 4001 to the correct port number.
    4. Alternatively, if you have the device directly connected to a serial port on the machine,
       uncomment and modify the drvAsynSerialPortConfigure and asynSetOption lines to, 
       match the device's baud rate and other settings:
       ```
       drvAsynSerialPortConfigure("$(PORT)", "/dev/ttyS0")
       asynSetOption("$(PORT)", 0, "baud", "115200")
       asynSetOption("$(PORT)", 0, "bits", "8")
       asynSetOption("$(PORT)", 0, "parity", "none")
       asynSetOption("$(PORT)", 0, "stop", "1")
       asynSetOption("$(PORT)", 0, "clocal", "Y")
       asynSetOption("$(PORT)", 0, "crtscts", "N")
       ```

4. Go to the top directory and run `make`
5. If all goes well:

    ```
    cd iocBoot/iocf460
    chmod +x st.cmd
    ./st.cmd
    ```

6. Run Control System Studio and open f460.opi.
