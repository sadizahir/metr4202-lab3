function angles = getmotorangles
global ANGLE_UNIT;
global ANGLE_UNIT_MX;
global mA;
global mB;
global mC;
global mA_offset;
global mB_offset;
global mC_offset;
global PRESENT_POSITION;

t1 = read_info(mA, PRESENT_POSITION, 2)*ANGLE_UNIT_MX-mA_offset;
t2 = read_info(mB, PRESENT_POSITION, 2)*ANGLE_UNIT-mB_offset;
t3 = read_info(mC, PRESENT_POSITION, 2)*ANGLE_UNIT-mC_offset;

angles = [t1, t2, t3];