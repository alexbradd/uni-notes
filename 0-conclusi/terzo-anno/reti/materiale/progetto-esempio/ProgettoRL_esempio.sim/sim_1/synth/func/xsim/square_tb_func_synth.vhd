-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Mon Nov 22 10:34:40 2021
-- Host        : kerchoo running 64-bit unknown
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /var/home/breadyx/vivado/ProgettoRL_esempio/ProgettoRL_esempio.sim/sim_1/synth/func/xsim/square_tb_func_synth.vhd
-- Design      : square
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity datapath is
  port (
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    o_data_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \o_reg1_reg[7]_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end datapath;

architecture STRUCTURE of datapath is
  signal A : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \FSM_sequential_cur_state[2]_i_3_n_0\ : STD_LOGIC;
  signal mux_reg3 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \o_reg2[0]_i_10_n_0\ : STD_LOGIC;
  signal \o_reg2[0]_i_3_n_0\ : STD_LOGIC;
  signal \o_reg2[0]_i_4_n_0\ : STD_LOGIC;
  signal \o_reg2[0]_i_5_n_0\ : STD_LOGIC;
  signal \o_reg2[0]_i_6_n_0\ : STD_LOGIC;
  signal \o_reg2[0]_i_7_n_0\ : STD_LOGIC;
  signal \o_reg2[0]_i_8_n_0\ : STD_LOGIC;
  signal \o_reg2[0]_i_9_n_0\ : STD_LOGIC;
  signal \o_reg2[12]_i_2_n_0\ : STD_LOGIC;
  signal \o_reg2[12]_i_3_n_0\ : STD_LOGIC;
  signal \o_reg2[12]_i_4_n_0\ : STD_LOGIC;
  signal \o_reg2[12]_i_5_n_0\ : STD_LOGIC;
  signal \o_reg2[4]_i_2_n_0\ : STD_LOGIC;
  signal \o_reg2[4]_i_3_n_0\ : STD_LOGIC;
  signal \o_reg2[4]_i_4_n_0\ : STD_LOGIC;
  signal \o_reg2[4]_i_5_n_0\ : STD_LOGIC;
  signal \o_reg2[4]_i_6_n_0\ : STD_LOGIC;
  signal \o_reg2[4]_i_7_n_0\ : STD_LOGIC;
  signal \o_reg2[4]_i_8_n_0\ : STD_LOGIC;
  signal \o_reg2[4]_i_9_n_0\ : STD_LOGIC;
  signal \o_reg2[8]_i_2_n_0\ : STD_LOGIC;
  signal \o_reg2[8]_i_3_n_0\ : STD_LOGIC;
  signal \o_reg2[8]_i_4_n_0\ : STD_LOGIC;
  signal \o_reg2[8]_i_5_n_0\ : STD_LOGIC;
  signal o_reg2_reg : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \o_reg2_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \o_reg2_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \o_reg2_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \o_reg2_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \o_reg2_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \o_reg2_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \o_reg2_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \o_reg2_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \o_reg2_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \o_reg2_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \o_reg2_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \o_reg2_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \o_reg2_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \o_reg2_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \o_reg2_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \o_reg2_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \o_reg2_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \o_reg2_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \o_reg2_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \o_reg2_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \o_reg2_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \o_reg2_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \o_reg2_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \o_reg2_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \o_reg2_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \o_reg2_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \o_reg2_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \o_reg2_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \o_reg2_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \o_reg2_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \o_reg2_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \o_reg3[6]_i_2_n_0\ : STD_LOGIC;
  signal \o_reg3[6]_i_3_n_0\ : STD_LOGIC;
  signal \o_reg3[7]_i_1_n_0\ : STD_LOGIC;
  signal o_reg3_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal r1_load : STD_LOGIC;
  signal r2_load : STD_LOGIC;
  signal \NLW_o_reg2_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_cur_state[2]_i_2\ : label is "soft_lutpair0";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \o_reg2_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \o_reg2_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \o_reg2_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \o_reg2_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of \o_reg3[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \o_reg3[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \o_reg3[6]_i_2\ : label is "soft_lutpair0";
begin
\FSM_sequential_cur_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFCF55555555"
    )
        port map (
      I0 => Q(0),
      I1 => o_reg3_reg(7),
      I2 => \FSM_sequential_cur_state[2]_i_3_n_0\,
      I3 => o_reg3_reg(6),
      I4 => Q(2),
      I5 => Q(1),
      O => D(0)
    );
\FSM_sequential_cur_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFCFAAAAAAAA"
    )
        port map (
      I0 => Q(0),
      I1 => o_reg3_reg(7),
      I2 => \FSM_sequential_cur_state[2]_i_3_n_0\,
      I3 => o_reg3_reg(6),
      I4 => Q(2),
      I5 => Q(1),
      O => D(1)
    );
\FSM_sequential_cur_state[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF0400"
    )
        port map (
      I0 => o_reg3_reg(7),
      I1 => \FSM_sequential_cur_state[2]_i_3_n_0\,
      I2 => o_reg3_reg(6),
      I3 => Q(1),
      I4 => Q(2),
      O => D(2)
    );
\FSM_sequential_cur_state[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => o_reg3_reg(4),
      I1 => o_reg3_reg(3),
      I2 => o_reg3_reg(1),
      I3 => o_reg3_reg(0),
      I4 => o_reg3_reg(2),
      I5 => o_reg3_reg(5),
      O => \FSM_sequential_cur_state[2]_i_3_n_0\
    );
\o_data_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => o_reg2_reg(8),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(2),
      I4 => o_reg2_reg(0),
      O => o_data_OBUF(0)
    );
\o_data_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => o_reg2_reg(9),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(2),
      I4 => o_reg2_reg(1),
      O => o_data_OBUF(1)
    );
\o_data_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => o_reg2_reg(10),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(2),
      I4 => o_reg2_reg(2),
      O => o_data_OBUF(2)
    );
\o_data_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => o_reg2_reg(11),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(2),
      I4 => o_reg2_reg(3),
      O => o_data_OBUF(3)
    );
\o_data_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => o_reg2_reg(12),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(2),
      I4 => o_reg2_reg(4),
      O => o_data_OBUF(4)
    );
\o_data_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => o_reg2_reg(13),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(2),
      I4 => o_reg2_reg(5),
      O => o_data_OBUF(5)
    );
\o_data_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => o_reg2_reg(14),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(2),
      I4 => o_reg2_reg(6),
      O => o_data_OBUF(6)
    );
\o_data_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => o_reg2_reg(15),
      I1 => Q(1),
      I2 => Q(0),
      I3 => Q(2),
      I4 => o_reg2_reg(7),
      O => o_data_OBUF(7)
    );
\o_reg1[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => Q(2),
      I1 => Q(0),
      I2 => Q(1),
      O => r1_load
    );
\o_reg1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r1_load,
      CLR => AR(0),
      D => \o_reg1_reg[7]_0\(0),
      Q => A(0)
    );
\o_reg1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r1_load,
      CLR => AR(0),
      D => \o_reg1_reg[7]_0\(1),
      Q => A(1)
    );
\o_reg1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r1_load,
      CLR => AR(0),
      D => \o_reg1_reg[7]_0\(2),
      Q => A(2)
    );
\o_reg1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r1_load,
      CLR => AR(0),
      D => \o_reg1_reg[7]_0\(3),
      Q => A(3)
    );
\o_reg1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r1_load,
      CLR => AR(0),
      D => \o_reg1_reg[7]_0\(4),
      Q => A(4)
    );
\o_reg1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r1_load,
      CLR => AR(0),
      D => \o_reg1_reg[7]_0\(5),
      Q => A(5)
    );
\o_reg1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r1_load,
      CLR => AR(0),
      D => \o_reg1_reg[7]_0\(6),
      Q => A(6)
    );
\o_reg1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r1_load,
      CLR => AR(0),
      D => \o_reg1_reg[7]_0\(7),
      Q => A(7)
    );
\o_reg2[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => Q(0),
      I1 => Q(2),
      O => r2_load
    );
\o_reg2[0]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000800"
    )
        port map (
      I0 => A(0),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(0),
      I4 => o_reg2_reg(0),
      O => \o_reg2[0]_i_10_n_0\
    );
\o_reg2[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => A(3),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[0]_i_3_n_0\
    );
\o_reg2[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => A(2),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[0]_i_4_n_0\
    );
\o_reg2[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => A(1),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[0]_i_5_n_0\
    );
\o_reg2[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => A(0),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[0]_i_6_n_0\
    );
\o_reg2[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000800"
    )
        port map (
      I0 => A(3),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(0),
      I4 => o_reg2_reg(3),
      O => \o_reg2[0]_i_7_n_0\
    );
\o_reg2[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000800"
    )
        port map (
      I0 => A(2),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(0),
      I4 => o_reg2_reg(2),
      O => \o_reg2[0]_i_8_n_0\
    );
\o_reg2[0]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000800"
    )
        port map (
      I0 => A(1),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(0),
      I4 => o_reg2_reg(1),
      O => \o_reg2[0]_i_9_n_0\
    );
\o_reg2[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => o_reg2_reg(15),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[12]_i_2_n_0\
    );
\o_reg2[12]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => o_reg2_reg(14),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[12]_i_3_n_0\
    );
\o_reg2[12]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => o_reg2_reg(13),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[12]_i_4_n_0\
    );
\o_reg2[12]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => o_reg2_reg(12),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[12]_i_5_n_0\
    );
\o_reg2[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => A(7),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[4]_i_2_n_0\
    );
\o_reg2[4]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => A(6),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[4]_i_3_n_0\
    );
\o_reg2[4]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => A(5),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[4]_i_4_n_0\
    );
\o_reg2[4]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => A(4),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[4]_i_5_n_0\
    );
\o_reg2[4]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000800"
    )
        port map (
      I0 => A(7),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(0),
      I4 => o_reg2_reg(7),
      O => \o_reg2[4]_i_6_n_0\
    );
\o_reg2[4]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000800"
    )
        port map (
      I0 => A(6),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(0),
      I4 => o_reg2_reg(6),
      O => \o_reg2[4]_i_7_n_0\
    );
\o_reg2[4]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000800"
    )
        port map (
      I0 => A(5),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(0),
      I4 => o_reg2_reg(5),
      O => \o_reg2[4]_i_8_n_0\
    );
\o_reg2[4]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000800"
    )
        port map (
      I0 => A(4),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(0),
      I4 => o_reg2_reg(4),
      O => \o_reg2[4]_i_9_n_0\
    );
\o_reg2[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => o_reg2_reg(11),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[8]_i_2_n_0\
    );
\o_reg2[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => o_reg2_reg(10),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[8]_i_3_n_0\
    );
\o_reg2[8]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => o_reg2_reg(9),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[8]_i_4_n_0\
    );
\o_reg2[8]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => o_reg2_reg(8),
      I1 => Q(0),
      I2 => Q(2),
      I3 => Q(1),
      O => \o_reg2[8]_i_5_n_0\
    );
\o_reg2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[0]_i_2_n_7\,
      Q => o_reg2_reg(0)
    );
\o_reg2_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \o_reg2_reg[0]_i_2_n_0\,
      CO(2) => \o_reg2_reg[0]_i_2_n_1\,
      CO(1) => \o_reg2_reg[0]_i_2_n_2\,
      CO(0) => \o_reg2_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => \o_reg2[0]_i_3_n_0\,
      DI(2) => \o_reg2[0]_i_4_n_0\,
      DI(1) => \o_reg2[0]_i_5_n_0\,
      DI(0) => \o_reg2[0]_i_6_n_0\,
      O(3) => \o_reg2_reg[0]_i_2_n_4\,
      O(2) => \o_reg2_reg[0]_i_2_n_5\,
      O(1) => \o_reg2_reg[0]_i_2_n_6\,
      O(0) => \o_reg2_reg[0]_i_2_n_7\,
      S(3) => \o_reg2[0]_i_7_n_0\,
      S(2) => \o_reg2[0]_i_8_n_0\,
      S(1) => \o_reg2[0]_i_9_n_0\,
      S(0) => \o_reg2[0]_i_10_n_0\
    );
\o_reg2_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[8]_i_1_n_5\,
      Q => o_reg2_reg(10)
    );
\o_reg2_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[8]_i_1_n_4\,
      Q => o_reg2_reg(11)
    );
\o_reg2_reg[12]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[12]_i_1_n_7\,
      Q => o_reg2_reg(12)
    );
\o_reg2_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_reg2_reg[8]_i_1_n_0\,
      CO(3) => \NLW_o_reg2_reg[12]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \o_reg2_reg[12]_i_1_n_1\,
      CO(1) => \o_reg2_reg[12]_i_1_n_2\,
      CO(0) => \o_reg2_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \o_reg2_reg[12]_i_1_n_4\,
      O(2) => \o_reg2_reg[12]_i_1_n_5\,
      O(1) => \o_reg2_reg[12]_i_1_n_6\,
      O(0) => \o_reg2_reg[12]_i_1_n_7\,
      S(3) => \o_reg2[12]_i_2_n_0\,
      S(2) => \o_reg2[12]_i_3_n_0\,
      S(1) => \o_reg2[12]_i_4_n_0\,
      S(0) => \o_reg2[12]_i_5_n_0\
    );
\o_reg2_reg[13]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[12]_i_1_n_6\,
      Q => o_reg2_reg(13)
    );
\o_reg2_reg[14]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[12]_i_1_n_5\,
      Q => o_reg2_reg(14)
    );
\o_reg2_reg[15]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[12]_i_1_n_4\,
      Q => o_reg2_reg(15)
    );
\o_reg2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[0]_i_2_n_6\,
      Q => o_reg2_reg(1)
    );
\o_reg2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[0]_i_2_n_5\,
      Q => o_reg2_reg(2)
    );
\o_reg2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[0]_i_2_n_4\,
      Q => o_reg2_reg(3)
    );
\o_reg2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[4]_i_1_n_7\,
      Q => o_reg2_reg(4)
    );
\o_reg2_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_reg2_reg[0]_i_2_n_0\,
      CO(3) => \o_reg2_reg[4]_i_1_n_0\,
      CO(2) => \o_reg2_reg[4]_i_1_n_1\,
      CO(1) => \o_reg2_reg[4]_i_1_n_2\,
      CO(0) => \o_reg2_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \o_reg2[4]_i_2_n_0\,
      DI(2) => \o_reg2[4]_i_3_n_0\,
      DI(1) => \o_reg2[4]_i_4_n_0\,
      DI(0) => \o_reg2[4]_i_5_n_0\,
      O(3) => \o_reg2_reg[4]_i_1_n_4\,
      O(2) => \o_reg2_reg[4]_i_1_n_5\,
      O(1) => \o_reg2_reg[4]_i_1_n_6\,
      O(0) => \o_reg2_reg[4]_i_1_n_7\,
      S(3) => \o_reg2[4]_i_6_n_0\,
      S(2) => \o_reg2[4]_i_7_n_0\,
      S(1) => \o_reg2[4]_i_8_n_0\,
      S(0) => \o_reg2[4]_i_9_n_0\
    );
\o_reg2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[4]_i_1_n_6\,
      Q => o_reg2_reg(5)
    );
\o_reg2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[4]_i_1_n_5\,
      Q => o_reg2_reg(6)
    );
\o_reg2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[4]_i_1_n_4\,
      Q => o_reg2_reg(7)
    );
\o_reg2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[8]_i_1_n_7\,
      Q => o_reg2_reg(8)
    );
\o_reg2_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \o_reg2_reg[4]_i_1_n_0\,
      CO(3) => \o_reg2_reg[8]_i_1_n_0\,
      CO(2) => \o_reg2_reg[8]_i_1_n_1\,
      CO(1) => \o_reg2_reg[8]_i_1_n_2\,
      CO(0) => \o_reg2_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \o_reg2_reg[8]_i_1_n_4\,
      O(2) => \o_reg2_reg[8]_i_1_n_5\,
      O(1) => \o_reg2_reg[8]_i_1_n_6\,
      O(0) => \o_reg2_reg[8]_i_1_n_7\,
      S(3) => \o_reg2[8]_i_2_n_0\,
      S(2) => \o_reg2[8]_i_3_n_0\,
      S(1) => \o_reg2[8]_i_4_n_0\,
      S(0) => \o_reg2[8]_i_5_n_0\
    );
\o_reg2_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => r2_load,
      CLR => AR(0),
      D => \o_reg2_reg[8]_i_1_n_6\,
      Q => o_reg2_reg(9)
    );
\o_reg3[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"2E"
    )
        port map (
      I0 => \o_reg1_reg[7]_0\(0),
      I1 => Q(1),
      I2 => o_reg3_reg(0),
      O => mux_reg3(0)
    );
\o_reg3[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E22E"
    )
        port map (
      I0 => \o_reg1_reg[7]_0\(1),
      I1 => Q(1),
      I2 => o_reg3_reg(1),
      I3 => o_reg3_reg(0),
      O => mux_reg3(1)
    );
\o_reg3[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEE2222E"
    )
        port map (
      I0 => \o_reg1_reg[7]_0\(2),
      I1 => Q(1),
      I2 => o_reg3_reg(1),
      I3 => o_reg3_reg(0),
      I4 => o_reg3_reg(2),
      O => mux_reg3(2)
    );
\o_reg3[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBB88888888B"
    )
        port map (
      I0 => \o_reg1_reg[7]_0\(3),
      I1 => \o_reg3[6]_i_2_n_0\,
      I2 => o_reg3_reg(2),
      I3 => o_reg3_reg(0),
      I4 => o_reg3_reg(1),
      I5 => o_reg3_reg(3),
      O => mux_reg3(3)
    );
\o_reg3[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2EE2"
    )
        port map (
      I0 => \o_reg1_reg[7]_0\(4),
      I1 => Q(1),
      I2 => o_reg3_reg(4),
      I3 => \o_reg3[6]_i_3_n_0\,
      O => mux_reg3(4)
    );
\o_reg3[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E22EE2E2"
    )
        port map (
      I0 => \o_reg1_reg[7]_0\(5),
      I1 => Q(1),
      I2 => o_reg3_reg(5),
      I3 => o_reg3_reg(4),
      I4 => \o_reg3[6]_i_3_n_0\,
      O => mux_reg3(5)
    );
\o_reg3[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8B88BB8B8"
    )
        port map (
      I0 => \o_reg1_reg[7]_0\(6),
      I1 => \o_reg3[6]_i_2_n_0\,
      I2 => o_reg3_reg(6),
      I3 => o_reg3_reg(5),
      I4 => \o_reg3[6]_i_3_n_0\,
      I5 => o_reg3_reg(4),
      O => mux_reg3(6)
    );
\o_reg3[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => Q(2),
      I1 => Q(1),
      O => \o_reg3[6]_i_2_n_0\
    );
\o_reg3[6]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => o_reg3_reg(3),
      I1 => o_reg3_reg(1),
      I2 => o_reg3_reg(0),
      I3 => o_reg3_reg(2),
      O => \o_reg3[6]_i_3_n_0\
    );
\o_reg3[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"54"
    )
        port map (
      I0 => Q(2),
      I1 => Q(0),
      I2 => Q(1),
      O => \o_reg3[7]_i_1_n_0\
    );
\o_reg3[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"D2FFD200"
    )
        port map (
      I0 => \FSM_sequential_cur_state[2]_i_3_n_0\,
      I1 => o_reg3_reg(6),
      I2 => o_reg3_reg(7),
      I3 => Q(1),
      I4 => \o_reg1_reg[7]_0\(7),
      O => mux_reg3(7)
    );
\o_reg3_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \o_reg3[7]_i_1_n_0\,
      CLR => AR(0),
      D => mux_reg3(0),
      Q => o_reg3_reg(0)
    );
\o_reg3_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \o_reg3[7]_i_1_n_0\,
      CLR => AR(0),
      D => mux_reg3(1),
      Q => o_reg3_reg(1)
    );
\o_reg3_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \o_reg3[7]_i_1_n_0\,
      CLR => AR(0),
      D => mux_reg3(2),
      Q => o_reg3_reg(2)
    );
\o_reg3_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \o_reg3[7]_i_1_n_0\,
      CLR => AR(0),
      D => mux_reg3(3),
      Q => o_reg3_reg(3)
    );
\o_reg3_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \o_reg3[7]_i_1_n_0\,
      CLR => AR(0),
      D => mux_reg3(4),
      Q => o_reg3_reg(4)
    );
\o_reg3_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \o_reg3[7]_i_1_n_0\,
      CLR => AR(0),
      D => mux_reg3(5),
      Q => o_reg3_reg(5)
    );
\o_reg3_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \o_reg3[7]_i_1_n_0\,
      CLR => AR(0),
      D => mux_reg3(6),
      Q => o_reg3_reg(6)
    );
\o_reg3_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => \o_reg3[7]_i_1_n_0\,
      CLR => AR(0),
      D => mux_reg3(7),
      Q => o_reg3_reg(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity square is
  port (
    i_clk : in STD_LOGIC;
    i_res : in STD_LOGIC;
    i_start : in STD_LOGIC;
    o_done : out STD_LOGIC;
    i_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    o_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    o_addr : out STD_LOGIC_VECTOR ( 1 downto 0 );
    o_en : out STD_LOGIC;
    o_we : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of square : entity is true;
end square;

architecture STRUCTURE of square is
  signal \FSM_sequential_cur_state[2]_i_1_n_0\ : STD_LOGIC;
  signal cur_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal i_clk_IBUF : STD_LOGIC;
  signal i_clk_IBUF_BUFG : STD_LOGIC;
  signal i_data_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal i_res_IBUF : STD_LOGIC;
  signal i_start_IBUF : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal o_addr_OBUF : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal o_data_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal o_done_OBUF : STD_LOGIC;
  signal o_en_OBUF : STD_LOGIC;
  signal o_we_OBUF : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_cur_state_reg[0]\ : label is "s0:000,s1:001,s2:010,s5:101,s6:110,s3:011,s4:100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_cur_state_reg[1]\ : label is "s0:000,s1:001,s2:010,s5:101,s6:110,s3:011,s4:100";
  attribute FSM_ENCODED_STATES of \FSM_sequential_cur_state_reg[2]\ : label is "s0:000,s1:001,s2:010,s5:101,s6:110,s3:011,s4:100";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \o_addr_OBUF[0]_inst_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \o_addr_OBUF[1]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of o_done_OBUF_inst_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of o_en_OBUF_inst_i_1 : label is "soft_lutpair2";
begin
DATAPATH0: entity work.datapath
     port map (
      AR(0) => i_res_IBUF,
      CLK => i_clk_IBUF_BUFG,
      D(2 downto 0) => next_state(2 downto 0),
      Q(2 downto 0) => cur_state(2 downto 0),
      o_data_OBUF(7 downto 0) => o_data_OBUF(7 downto 0),
      \o_reg1_reg[7]_0\(7 downto 0) => i_data_IBUF(7 downto 0)
    );
\FSM_sequential_cur_state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5FFE"
    )
        port map (
      I0 => cur_state(1),
      I1 => i_start_IBUF,
      I2 => cur_state(0),
      I3 => cur_state(2),
      O => \FSM_sequential_cur_state[2]_i_1_n_0\
    );
\FSM_sequential_cur_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_sequential_cur_state[2]_i_1_n_0\,
      CLR => i_res_IBUF,
      D => next_state(0),
      Q => cur_state(0)
    );
\FSM_sequential_cur_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_sequential_cur_state[2]_i_1_n_0\,
      CLR => i_res_IBUF,
      D => next_state(1),
      Q => cur_state(1)
    );
\FSM_sequential_cur_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_clk_IBUF_BUFG,
      CE => \FSM_sequential_cur_state[2]_i_1_n_0\,
      CLR => i_res_IBUF,
      D => next_state(2),
      Q => cur_state(2)
    );
i_clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => i_clk_IBUF,
      O => i_clk_IBUF_BUFG
    );
i_clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_clk,
      O => i_clk_IBUF
    );
\i_data_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(0),
      O => i_data_IBUF(0)
    );
\i_data_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(1),
      O => i_data_IBUF(1)
    );
\i_data_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(2),
      O => i_data_IBUF(2)
    );
\i_data_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(3),
      O => i_data_IBUF(3)
    );
\i_data_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(4),
      O => i_data_IBUF(4)
    );
\i_data_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(5),
      O => i_data_IBUF(5)
    );
\i_data_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(6),
      O => i_data_IBUF(6)
    );
\i_data_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => i_data(7),
      O => i_data_IBUF(7)
    );
i_res_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_res,
      O => i_res_IBUF
    );
i_start_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => i_start,
      O => i_start_IBUF
    );
\o_addr_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_addr_OBUF(0),
      O => o_addr(0)
    );
\o_addr_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => cur_state(0),
      I1 => cur_state(1),
      I2 => cur_state(2),
      O => o_addr_OBUF(0)
    );
\o_addr_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_addr_OBUF(1),
      O => o_addr(1)
    );
\o_addr_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => cur_state(1),
      I1 => cur_state(0),
      I2 => cur_state(2),
      O => o_addr_OBUF(1)
    );
\o_data_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(0),
      O => o_data(0)
    );
\o_data_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(1),
      O => o_data(1)
    );
\o_data_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(2),
      O => o_data(2)
    );
\o_data_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(3),
      O => o_data(3)
    );
\o_data_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(4),
      O => o_data(4)
    );
\o_data_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(5),
      O => o_data(5)
    );
\o_data_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(6),
      O => o_data(6)
    );
\o_data_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => o_data_OBUF(7),
      O => o_data(7)
    );
o_done_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_done_OBUF,
      O => o_done
    );
o_done_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => cur_state(0),
      I1 => cur_state(1),
      I2 => cur_state(2),
      O => o_done_OBUF
    );
o_en_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_en_OBUF,
      O => o_en
    );
o_en_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"32"
    )
        port map (
      I0 => cur_state(0),
      I1 => cur_state(1),
      I2 => cur_state(2),
      O => o_en_OBUF
    );
o_we_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => o_we_OBUF,
      O => o_we
    );
o_we_OBUF_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cur_state(2),
      I1 => cur_state(1),
      O => o_we_OBUF
    );
end STRUCTURE;
