RUN script over BUTool
    1. cd l0mdt-sm-sw-core/ python3 l0mdt_IC.py /opt/address_table/connections.xml test.0
    2. mkdir -p build/ 
    3. cd build/ 
    4. cmake3 -DNO_BOOST_LOGGING=1 -DCMAKE_PREFIX_PATH=/usr/local/lib/python3.6/site-packages/pybind11/share/cmake/pybind11/ -DBUILD_PYTHON_BINDINGS=1 .. 
    5. make
    6. export PYTHONPATH=$(pwd):$PYTHONPATH 
    7. cd $PROJECTDIR

Use a simply python script like the one at [2] To run it 
python3 l0mdt_LpGBTV1_conf.py /opt/address_table/connections.xml test.0 master write CSM_VF_master.cnf
python3 l0mdt_LpGBTV1_conf.py /opt/address_table/connections.xml test.0 slave write CSM_VF_slave.cnf
python3 l0mdt_LpGBTV1_conf.py /opt/address_table/connections.xml test.0 master read
python3 l0mdt_LpGBTV1_conf.py /opt/address_table/connections.xml test.0 slave read
python3 sca_read.py /opt/address_table/connections.xml test.0
