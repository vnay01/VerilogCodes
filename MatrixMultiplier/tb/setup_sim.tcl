## This script is not complete ##

# Update source file set for simulation

set_property SRC ${pwd}

set_property SOURCE_SET sources_1 [get_filesets sim_1]

add_files -fileset sim_1 -scan_for_includes ${pwd}/../tb/*.sv


# Add simulation sources
#
#

