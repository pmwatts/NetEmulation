
# rdm34, 20/8/10
# need to add min/max libraries

set DESIGN_NAME "alloc_simple" ;

# Enter the list of source RTL files if reading from RTL
set RTL_SOURCE_FILES  "ppe.sv arbiter.sv alloc_simple.sv" 

#https://solvnet.synopsys.com/dow_retrieve/D-2010.06/manpages/syn2/set_min_library.html?otSearchResultSrc=advSearch&otSearchResultNumber=3&otPageNum=1

set TARGET_LIBRARY_FILES      "./kit/typ.db" ;
set ADDITIONAL_LINK_LIB_FILES "" ;

set ADDITIONAL_SEARCH_PATH    ".. ../simple_optical ../mesh" ;

#set TARGET_LIBRARY_FILES     "./kit/slow.db" ;
#set MIN_LIBRARY_FILES        "./kit/slow.db /kit/fast.db";

set MIN_LIBRARY_FILES         "";

# Milkyway reference library and technology file
set MW_REFERENCE_LIB_DIRS     "./kit/milkyway/techFreePDK45" ;
set TECH_FILE                 "./kit/milkyway/techFreePDK45.tf" ;

# TPUplus files
set MAP_FILE                  "./kit/tluplus/tf2itf.map" ;
set TLUPLUS_MAX_FILE          "./kit/tluplus/nangate45.tlu" ;
set TLUPLUS_MIN_FILE          "./kit/tluplus/nangate45.tlu" ;

set MW_POWER_NET              "VDD" ;
set MW_POWER_PORT             "VDD" ;
set MW_GROUND_NET             "VSS" ;
set MW_GROUND_PORT            "VSS" ;

set MIN_ROUTING_LAYER         "";
set MAX_ROUTING_LAYER         "";

# Tcl file with library modifications for dont_use
set LIBRARY_DONT_USE_FILE     "";



