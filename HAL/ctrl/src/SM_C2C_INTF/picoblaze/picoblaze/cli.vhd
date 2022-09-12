--
-- Inferred program rom test for PicoBlaze
--
-- Generated at 2021-12-10 13:35:57.456204

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cli is

  port (
    address     : in  std_logic_vector(11-1 downto 0);
    instruction : out std_logic_vector(17 downto 0);
    portB_addr  : in  std_logic_vector(11-1 downto 0);
    portB_wen   : in  std_logic;                    
    portB_di    : in  std_logic_vector(17 downto 0);
    portB_do    : out std_logic_vector(17 downto 0);
    msize       : out std_logic_vector(11-1 downto 0);
    clk         : in  std_logic);

end entity cli;


architecture syn of cli is
  -- N.B. (0 to nn) order needed otherwise data is backwards!
  type ram_type is array (0 to 1538-1 ) of std_logic_vector(19 downto 0);
  signal RAM : ram_type := (
    X"28000",
    X"20082",
    X"223CC",
    X"09000",
    X"0D004",
    X"31000",
    X"22003",
    X"09000",
    X"0D008",
    X"39000",
    X"22007",
    X"09000",
    X"0D008",
    X"25000",
    X"09000",
    X"0D001",
    X"25000",
    X"09000",
    X"0D020",
    X"25000",
    X"09000",
    X"0D004",
    X"25000",
    X"09000",
    X"0D010",
    X"25000",
    X"09000",
    X"0D002",
    X"25000",
    X"00020",
    X"20030",
    X"3E02D",
    X"00300",
    X"14306",
    X"14306",
    X"14306",
    X"14306",
    X"00010",
    X"20030",
    X"3E02D",
    X"10300",
    X"01001",
    X"1400E",
    X"00030",
    X"25000",
    X"01000",
    X"1400E",
    X"25000",
    X"19030",
    X"3A03E",
    X"1D00A",
    X"3A041",
    X"19011",
    X"3A03E",
    X"1100A",
    X"1D010",
    X"3A041",
    X"1902A",
    X"3A03E",
    X"1100A",
    X"1D010",
    X"3A041",
    X"01000",
    X"1400E",
    X"25000",
    X"25000",
    X"00200",
    X"1420E",
    X"1420E",
    X"1420E",
    X"1420E",
    X"11237",
    X"1D241",
    X"3E04C",
    X"3204C",
    X"19207",
    X"00100",
    X"0310F",
    X"11137",
    X"1D141",
    X"3E053",
    X"32053",
    X"19107",
    X"25000",
    X"20042",
    X"20003",
    X"2D201",
    X"20003",
    X"2D101",
    X"25000",
    X"20003",
    X"0100D",
    X"2D001",
    X"20003",
    X"0100A",
    X"2D001",
    X"25000",
    X"20003",
    X"0113E",
    X"2D101",
    X"25000",
    X"24BA0",
    X"1D100",
    X"3206D",
    X"20003",
    X"2D101",
    X"11A01",
    X"13B00",
    X"22065",
    X"25000",
    X"21142",
    X"21161",
    X"21164",
    X"21120",
    X"21161",
    X"21172",
    X"21167",
    X"21175",
    X"2116D",
    X"21165",
    X"2116E",
    X"21174",
    X"21173",
    X"2112E",
    X"21100",
    X"01B00",
    X"01A6E",
    X"20065",
    X"2005A",
    X"25000",
    X"20090",
    X"2B031",
    X"2B001",
    X"013FF",
    X"012FF",
    X"19301",
    X"3E087",
    X"19201",
    X"3E087",
    X"2041F",
    X"201F4",
    X"202C6",
    X"20061",
    X"25000",
    X"01000",
    X"2F020",
    X"2F023",
    X"25000",
    X"28000",
    X"20440",
    X"28001",
    X"20054",
    X"20003",
    X"0103A",
    X"2D001",
    X"20003",
    X"01020",
    X"2D001",
    X"25000",
    X"01000",
    X"20097",
    X"37001",
    X"16000",
    X"37000",
    X"20054",
    X"2005A",
    X"01001",
    X"20097",
    X"37001",
    X"16010",
    X"37000",
    X"20054",
    X"2005A",
    X"01002",
    X"20097",
    X"37001",
    X"16020",
    X"37000",
    X"20054",
    X"2005A",
    X"01003",
    X"20097",
    X"37001",
    X"16030",
    X"37000",
    X"20054",
    X"2005A",
    X"01004",
    X"20097",
    X"37001",
    X"16040",
    X"37000",
    X"20054",
    X"2005A",
    X"01005",
    X"20097",
    X"37001",
    X"16050",
    X"37000",
    X"20054",
    X"2005A",
    X"01006",
    X"20097",
    X"37001",
    X"16060",
    X"37000",
    X"20054",
    X"2005A",
    X"01007",
    X"20097",
    X"37001",
    X"16070",
    X"37000",
    X"20054",
    X"2005A",
    X"01008",
    X"20097",
    X"37001",
    X"16080",
    X"37000",
    X"20054",
    X"2005A",
    X"01009",
    X"20097",
    X"37001",
    X"16090",
    X"37000",
    X"20054",
    X"2005A",
    X"0100A",
    X"20097",
    X"37001",
    X"160A0",
    X"37000",
    X"20054",
    X"2005A",
    X"0100B",
    X"20097",
    X"37001",
    X"160B0",
    X"37000",
    X"20054",
    X"2005A",
    X"0100C",
    X"20097",
    X"37001",
    X"160C0",
    X"37000",
    X"20054",
    X"2005A",
    X"0100D",
    X"20097",
    X"37001",
    X"160D0",
    X"37000",
    X"20054",
    X"2005A",
    X"0100E",
    X"20097",
    X"37001",
    X"160E0",
    X"37000",
    X"20054",
    X"2005A",
    X"0100F",
    X"20097",
    X"37001",
    X"160F0",
    X"37000",
    X"20054",
    X"2005A",
    X"25000",
    X"0B023",
    X"1D002",
    X"3607D",
    X"0B02C",
    X"0B130",
    X"2E100",
    X"2005A",
    X"25000",
    X"01300",
    X"00030",
    X"20042",
    X"20054",
    X"20003",
    X"0103A",
    X"2D001",
    X"20003",
    X"01020",
    X"2D001",
    X"11304",
    X"19301",
    X"0A030",
    X"20042",
    X"20003",
    X"2D201",
    X"20003",
    X"2D101",
    X"00030",
    X"03003",
    X"1D000",
    X"36123",
    X"2005A",
    X"11304",
    X"1D300",
    X"32133",
    X"22119",
    X"2005A",
    X"25000",
    X"20225",
    X"0B023",
    X"1D004",
    X"3A13F",
    X"0B227",
    X"0B12B",
    X"10210",
    X"20351",
    X"203A0",
    X"20225",
    X"25000",
    X"20082",
    X"25000",
    X"2D004",
    X"2D105",
    X"01108",
    X"2D103",
    X"031FF",
    X"031FF",
    X"031FF",
    X"031FF",
    X"09003",
    X"0D010",
    X"3214A",
    X"09406",
    X"09507",
    X"09608",
    X"09709",
    X"25000",
    X"2D004",
    X"2D105",
    X"2D406",
    X"2D507",
    X"2D608",
    X"2D709",
    X"011F4",
    X"2D103",
    X"25000",
    X"0B023",
    X"1D002",
    X"32166",
    X"1D001",
    X"3607D",
    X"01E01",
    X"0112C",
    X"0AC10",
    X"11101",
    X"0AD10",
    X"2216F",
    X"0112C",
    X"0AC10",
    X"11101",
    X"0AD10",
    X"01E30",
    X"0AEE0",
    X"1DE00",
    X"3616F",
    X"01E01",
    X"000C0",
    X"001D0",
    X"20142",
    X"20003",
    X"01030",
    X"2D001",
    X"20003",
    X"01078",
    X"2D001",
    X"000D0",
    X"20054",
    X"000C0",
    X"20054",
    X"20003",
    X"01020",
    X"2D001",
    X"20003",
    X"01030",
    X"2D001",
    X"20003",
    X"01078",
    X"2D001",
    X"20003",
    X"00070",
    X"20054",
    X"20003",
    X"00060",
    X"20054",
    X"20003",
    X"00050",
    X"20054",
    X"20003",
    X"00040",
    X"20054",
    X"2005A",
    X"11C01",
    X"13D00",
    X"19E01",
    X"3616F",
    X"25000",
    X"0B023",
    X"1D002",
    X"3607D",
    X"1D001",
    X"3607D",
    X"0112C",
    X"0AC10",
    X"11101",
    X"0AD10",
    X"20003",
    X"01030",
    X"2D001",
    X"20003",
    X"01078",
    X"2D001",
    X"000D0",
    X"20054",
    X"000C0",
    X"20054",
    X"2005A",
    X"01F30",
    X"0AEF0",
    X"11F01",
    X"0AFF0",
    X"1DE00",
    X"361B2",
    X"01E01",
    X"000C0",
    X"001D0",
    X"20142",
    X"20003",
    X"01030",
    X"2D001",
    X"20003",
    X"01078",
    X"2D001",
    X"20003",
    X"00070",
    X"20054",
    X"20003",
    X"00060",
    X"20054",
    X"20003",
    X"00050",
    X"20054",
    X"20003",
    X"00040",
    X"20054",
    X"2005A",
    X"19E01",
    X"1BF00",
    X"1DE00",
    X"361B2",
    X"1DF00",
    X"361B2",
    X"25000",
    X"0B023",
    X"1D002",
    X"3607D",
    X"01030",
    X"0A100",
    X"00410",
    X"11001",
    X"0A100",
    X"00510",
    X"11001",
    X"0A100",
    X"00610",
    X"11001",
    X"0A100",
    X"00710",
    X"0112C",
    X"0A010",
    X"11101",
    X"0A110",
    X"20152",
    X"25000",
    X"21143",
    X"21132",
    X"21143",
    X"21120",
    X"2114C",
    X"21169",
    X"2116E",
    X"2116B",
    X"21120",
    X"21143",
    X"21154",
    X"21152",
    X"2114C",
    X"2113A",
    X"21120",
    X"21100",
    X"01B01",
    X"01AE4",
    X"20065",
    X"2005A",
    X"25000",
    X"21142",
    X"21175",
    X"21166",
    X"21166",
    X"21165",
    X"21172",
    X"2113A",
    X"21120",
    X"21100",
    X"21157",
    X"2116F",
    X"21172",
    X"21164",
    X"21120",
    X"21163",
    X"2116F",
    X"21175",
    X"2116E",
    X"21174",
    X"2113A",
    X"21120",
    X"21100",
    X"21157",
    X"2116F",
    X"21172",
    X"21164",
    X"21120",
    X"21173",
    X"21169",
    X"2117A",
    X"21165",
    X"21173",
    X"2113A",
    X"21120",
    X"21120",
    X"21120",
    X"21120",
    X"21100",
    X"21157",
    X"2116F",
    X"21172",
    X"21164",
    X"21120",
    X"21100",
    X"01B01",
    X"01AF9",
    X"20065",
    X"01100",
    X"0B220",
    X"1C120",
    X"3E231",
    X"20003",
    X"0A010",
    X"2D001",
    X"11101",
    X"2222A",
    X"20003",
    X"01020",
    X"2D001",
    X"20003",
    X"01028",
    X"2D001",
    X"00020",
    X"20042",
    X"20003",
    X"2D201",
    X"20003",
    X"2D101",
    X"20003",
    X"01029",
    X"2D001",
    X"2005A",
    X"01B02",
    X"01A02",
    X"20065",
    X"20003",
    X"0B023",
    X"20042",
    X"20003",
    X"2D201",
    X"20003",
    X"2D101",
    X"0B423",
    X"01300",
    X"1C340",
    X"3E25F",
    X"20003",
    X"01020",
    X"2D001",
    X"20003",
    X"01040",
    X"2D001",
    X"01124",
    X"10130",
    X"0A010",
    X"20042",
    X"20003",
    X"2D201",
    X"20003",
    X"2D101",
    X"11301",
    X"2224D",
    X"2005A",
    X"01B02",
    X"01A0F",
    X"20065",
    X"0B423",
    X"01300",
    X"1C340",
    X"3E274",
    X"20003",
    X"01020",
    X"2D001",
    X"01128",
    X"10130",
    X"0A010",
    X"20042",
    X"20003",
    X"2D201",
    X"20003",
    X"2D101",
    X"11301",
    X"22265",
    X"2005A",
    X"0B423",
    X"01300",
    X"1C340",
    X"3E297",
    X"2005A",
    X"01B02",
    X"01A1F",
    X"20065",
    X"00030",
    X"20042",
    X"20003",
    X"2D201",
    X"20003",
    X"2D101",
    X"20003",
    X"01020",
    X"2D001",
    X"00530",
    X"11301",
    X"14506",
    X"14506",
    X"1152C",
    X"00650",
    X"11603",
    X"1C650",
    X"3A277",
    X"0A060",
    X"20042",
    X"20003",
    X"2D201",
    X"20003",
    X"2D101",
    X"19601",
    X"2228D",
    X"2005A",
    X"25000",
    X"01B02",
    X"01ACB",
    X"24BA0",
    X"1D100",
    X"322A5",
    X"1D1FF",
    X"322A9",
    X"20003",
    X"2D101",
    X"11A01",
    X"13B00",
    X"2229B",
    X"2005A",
    X"11A03",
    X"13B00",
    X"2229B",
    X"2005A",
    X"25000",
    X"21132",
    X"21130",
    X"21132",
    X"21131",
    X"2112D",
    X"21131",
    X"21132",
    X"2112D",
    X"21131",
    X"21130",
    X"21120",
    X"21131",
    X"21133",
    X"2113A",
    X"21133",
    X"21135",
    X"2113A",
    X"21135",
    X"21131",
    X"2112E",
    X"21134",
    X"21130",
    X"21137",
    X"21136",
    X"21139",
    X"21131",
    X"21100",
    X"01B02",
    X"01AAB",
    X"20065",
    X"2005A",
    X"25000",
    X"2116D",
    X"21175",
    X"2116C",
    X"21174",
    X"21169",
    X"21161",
    X"21172",
    X"21167",
    X"21100",
    X"21101",
    X"21135",
    X"2116D",
    X"21165",
    X"2116D",
    X"21164",
    X"21175",
    X"2116D",
    X"21170",
    X"21100",
    X"21101",
    X"21118",
    X"2116D",
    X"21165",
    X"2116D",
    X"21177",
    X"21172",
    X"21100",
    X"21101",
    X"21110",
    X"21172",
    X"21165",
    X"21173",
    X"21165",
    X"21174",
    X"21100",
    X"21101",
    X"21140",
    X"21176",
    X"21165",
    X"21172",
    X"21173",
    X"21169",
    X"2116F",
    X"2116E",
    X"21100",
    X"21101",
    X"211F4",
    X"21173",
    X"21179",
    X"21173",
    X"21100",
    X"21102",
    X"21125",
    X"21168",
    X"21165",
    X"2116C",
    X"21170",
    X"21100",
    X"21102",
    X"21199",
    X"21164",
    X"21175",
    X"2116D",
    X"21170",
    X"21162",
    X"21100",
    X"21100",
    X"2119F",
    X"21162",
    X"21175",
    X"21169",
    X"2116C",
    X"21164",
    X"21100",
    X"21102",
    X"211C6",
    X"21162",
    X"21161",
    X"21163",
    X"2116B",
    X"21167",
    X"2116E",
    X"21164",
    X"21100",
    X"21100",
    X"21194",
    X"211FF",
    X"01B02",
    X"01ACB",
    X"01200",
    X"24BA0",
    X"1D100",
    X"32340",
    X"1D1FF",
    X"3234D",
    X"0B020",
    X"1C200",
    X"3E334",
    X"0A020",
    X"1C010",
    X"36334",
    X"11201",
    X"11A01",
    X"13B00",
    X"22325",
    X"24BA0",
    X"1D1FF",
    X"3234D",
    X"1D100",
    X"3233C",
    X"11A01",
    X"13B00",
    X"22334",
    X"11A03",
    X"13B00",
    X"01200",
    X"22325",
    X"20351",
    X"203A0",
    X"11A01",
    X"13B00",
    X"24BA0",
    X"00210",
    X"11A01",
    X"13B00",
    X"24BA0",
    X"24210",
    X"20090",
    X"20061",
    X"25000",
    X"20090",
    X"20388",
    X"20061",
    X"25000",
    X"01000",
    X"2F023",
    X"0B120",
    X"1C210",
    X"3E37B",
    X"0A020",
    X"11201",
    X"20030",
    X"3E353",
    X"19201",
    X"0B023",
    X"11001",
    X"1D005",
    X"3237B",
    X"2F023",
    X"01123",
    X"10100",
    X"2E210",
    X"00320",
    X"11308",
    X"0B120",
    X"1C310",
    X"3A369",
    X"00310",
    X"1C320",
    X"32370",
    X"0A020",
    X"20030",
    X"3E370",
    X"11201",
    X"22369",
    X"00320",
    X"0B123",
    X"11124",
    X"19101",
    X"0A010",
    X"18300",
    X"0B023",
    X"11028",
    X"19001",
    X"2E300",
    X"22353",
    X"25000",
    X"21142",
    X"21161",
    X"21164",
    X"21120",
    X"21163",
    X"2116F",
    X"2116D",
    X"2116D",
    X"21161",
    X"2116E",
    X"21164",
    X"21100",
    X"01B03",
    X"01A7C",
    X"20065",
    X"2005A",
    X"25000",
    X"21145",
    X"21172",
    X"21172",
    X"2116F",
    X"21172",
    X"2113A",
    X"21120",
    X"21100",
    X"01B03",
    X"01A8D",
    X"20065",
    X"00020",
    X"20042",
    X"20003",
    X"2D201",
    X"20003",
    X"2D101",
    X"2005A",
    X"25000",
    X"01238",
    X"11204",
    X"0112C",
    X"01000",
    X"2E010",
    X"11101",
    X"1C120",
    X"3A3A3",
    X"01400",
    X"0B023",
    X"1C400",
    X"3E3CB",
    X"01024",
    X"10040",
    X"0A500",
    X"01128",
    X"10140",
    X"0A610",
    X"10650",
    X"00740",
    X"14706",
    X"14706",
    X"1172C",
    X"11401",
    X"19602",
    X"3A3A9",
    X"1C650",
    X"3A3C4",
    X"0A260",
    X"11601",
    X"0A160",
    X"19601",
    X"2001D",
    X"2E070",
    X"11701",
    X"223B8",
    X"11601",
    X"1C650",
    X"363A9",
    X"0A060",
    X"20030",
    X"2E070",
    X"223A9",
    X"25000",
    X"28001",
    X"20007",
    X"28000",
    X"09001",
    X"0B120",
    X"11100",
    X"2E010",
    X"0B120",
    X"11101",
    X"2F120",
    X"1D120",
    X"3E3E5",
    X"203ED",
    X"38322",
    X"223CC",
    X"2114F",
    X"21176",
    X"21165",
    X"21172",
    X"21166",
    X"2116C",
    X"2116F",
    X"21177",
    X"21121",
    X"21100",
    X"2005A",
    X"01B03",
    X"01ADB",
    X"20065",
    X"2005A",
    X"20090",
    X"20061",
    X"223CC",
    X"0B020",
    X"19001",
    X"0A100",
    X"1D10D",
    X"32403",
    X"1D10A",
    X"32403",
    X"1D108",
    X"3240A",
    X"1D120",
    X"3E3FE",
    X"0B020",
    X"19001",
    X"2F020",
    X"01000",
    X"1400C",
    X"25000",
    X"20003",
    X"2D101",
    X"01000",
    X"1400C",
    X"25000",
    X"2005A",
    X"0B020",
    X"19001",
    X"2F020",
    X"01001",
    X"1400C",
    X"25000",
    X"0B020",
    X"19002",
    X"3A419",
    X"20003",
    X"01108",
    X"2D101",
    X"20003",
    X"01120",
    X"2D101",
    X"20003",
    X"01108",
    X"2D101",
    X"0B020",
    X"19001",
    X"2F020",
    X"0B020",
    X"19001",
    X"2F020",
    X"01000",
    X"1400C",
    X"25000",
    X"01040",
    X"11001",
    X"09103",
    X"1D109",
    X"3A425",
    X"01108",
    X"2E100",
    X"00010",
    X"20054",
    X"2005A",
    X"25000",
    X"01000",
    X"01140",
    X"1D180",
    X"32431",
    X"2E010",
    X"11101",
    X"2242C",
    X"25000",
    X"01040",
    X"11000",
    X"25000",
    X"01140",
    X"11105",
    X"20432",
    X"0A000",
    X"1D000",
    X"3243E",
    X"11105",
    X"19001",
    X"22439",
    X"00010",
    X"25000",
    X"37001",
    X"01040",
    X"11001",
    X"0A100",
    X"20432",
    X"0A200",
    X"1C210",
    X"3244F",
    X"2D203",
    X"20454",
    X"20432",
    X"0A200",
    X"11201",
    X"2E200",
    X"22441",
    X"20432",
    X"01100",
    X"2E100",
    X"37000",
    X"25000",
    X"20435",
    X"00100",
    X"11100",
    X"0AF10",
    X"00100",
    X"11101",
    X"0AE10",
    X"00100",
    X"11102",
    X"0AD10",
    X"00100",
    X"11103",
    X"0AC10",
    X"1DF04",
    X"32489",
    X"1DF02",
    X"3247E",
    X"1DF01",
    X"32475",
    X"01E00",
    X"01D00",
    X"09004",
    X"05004",
    X"2D004",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"07004",
    X"2D004",
    X"01F01",
    X"22494",
    X"11E01",
    X"3E479",
    X"01F00",
    X"22494",
    X"09004",
    X"0D002",
    X"3E494",
    X"01F02",
    X"22494",
    X"11D01",
    X"3E482",
    X"01F00",
    X"22494",
    X"09004",
    X"0D008",
    X"3E494",
    X"0D010",
    X"3E494",
    X"01F04",
    X"22494",
    X"09004",
    X"0D020",
    X"3A490",
    X"0D040",
    X"3A490",
    X"01C00",
    X"22494",
    X"11C01",
    X"3E494",
    X"01F00",
    X"22494",
    X"20435",
    X"00100",
    X"11100",
    X"2EF10",
    X"00100",
    X"11101",
    X"2EE10",
    X"00100",
    X"11102",
    X"2ED10",
    X"00100",
    X"11103",
    X"2EC10",
    X"2DF05",
    X"25000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"00000",
    X"20440",
    X"29001"

    );
begin

  process (clk) is
  begin  -- process
    if clk'event and clk = '1' then     -- rising clock edge
      instruction <= RAM(to_integer(unsigned(address)))(17 downto 0);
      if portB_wen = '1' then
        RAM(to_integer(unsigned(portB_addr))) <= B"00" & portB_di;
      end if;
    end if;
  end process;

  portB_do <= RAM(to_integer(unsigned(portB_addr)))(17 downto 0);

  msize <= std_logic_vector( to_unsigned( RAM'length, msize'length));

end syn;