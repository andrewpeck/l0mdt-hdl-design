REM ################################################################################
REM # Vivado 2016.2 batch file to create the HPTD Tx phase aligner
REM # This batch file uses the default Xilinx installation path.
REM ################################################################################
REM call C:\EDA\Xilinx\v2016_2\Vivado\2016.2\bin\vivado.bat -mode gui -source tx_aligner_proj.tcl

call C:\\Xilinx\\Vivado\\2016.2\\.\\bin\\vivado.bat -mode gui -source tx_aligner_proj.tcl

del *.jou
del *.log

REM pause