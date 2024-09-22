# Timing Analysis
# Link https://docs.amd.com/r/2021.1-English/ug906-vivado-design-analysis/Introduction-to-Timing-Analysis

    Max delay analysis in Slow Corner
    Min delay analysis in Slow Corner
    Max delay analysis in Fast Corner
    Min delay analysis in Fast Corner

Setup/Recovery
Hold/Removal


# Link https://docs.amd.com/r/2021.1-English/ug906-vivado-design-analysis/Timing-Analysis-Features

report_clock_networks -name {network_1}

report_clock_interaction -name clocks_1

report_pulse_width

report_timing -from -rise_from -fall_from

report_exceptions

report_exceptions

report_cdc -name cdc_1

