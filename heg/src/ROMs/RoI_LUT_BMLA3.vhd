--------------------------------------------------------------------------------
--  UMass , Physics Department               
--  Yuan-Tang Chou                           
--  yuan-tang.chou@cern.ch                         
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger             
--  Module: rpc_z to 1st layer tube number 
--  Description: Autogenerated file          
--                                           
--------------------------------------------------------------------------------
--  Revisions: 
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library heg_roi_lib;
use heg_roi_lib.roi_types_pkg.all;

package roi_lut_BMLA3 is

    -- add length of constant array
    constant ROM_BMLA3_Z_MAX_SIZE : integer := 9130;

    constant ROI_BMLA3_Z_MEM : roi_z_lut_t(0 to ROM_BMLA3_Z_MAX_SIZE - 1) := (

    0 to 149 =>-1,
    150 to 179 =>0,
    180 to 209 =>1,
    210 to 239 =>2,
    240 to 269 =>3,
    270 to 299 =>4,
    300 to 329 =>5,
    330 to 359 =>6,
    360 to 389 =>7,
    390 to 419 =>8,
    420 to 449 =>9,
    450 to 479 =>10,
    480 to 509 =>11,
    510 to 539 =>12,
    540 to 569 =>13,
    570 to 599 =>14,
    600 to 629 =>15,
    630 to 658 =>16,
    659 to 688 =>17,
    689 to 718 =>18,
    719 to 748 =>19,
    749 to 778 =>20,
    779 to 808 =>21,
    809 to 838 =>22,
    839 to 868 =>23,
    869 to 898 =>24,
    899 to 928 =>25,
    929 to 958 =>26,
    959 to 988 =>27,
    989 to 1018 =>28,
    1019 to 1048 =>29,
    1049 to 1078 =>30,
    1079 to 1108 =>31,
    1109 to 1138 =>32,
    1139 to 1168 =>33,
    1169 to 1198 =>34,
    1199 to 1228 =>35,
    1229 to 1258 =>36,
    1259 to 1288 =>37,
    1289 to 1318 =>38,
    1319 to 1348 =>39,
    1349 to 1378 =>40,
    1379 to 1408 =>41,
    1409 to 1438 =>42,
    1439 to 1468 =>43,
    1469 to 1498 =>44,
    1499 to 1528 =>45,
    1529 to 1558 =>46,
    1559 to 1588 =>47,
    1589 to 1618 =>48,
    1619 to 1648 =>49,
    1649 to 1677 =>50,
    1678 to 1707 =>51,
    1708 to 1737 =>52,
    1738 to 1767 =>53,
    1768 to 1797 =>54,
    1798 to 1827 =>55,
    1828 to 1849 =>-1,
    1850 to 1879 =>56,
    1880 to 1909 =>57,
    1910 to 1939 =>58,
    1940 to 1969 =>59,
    1970 to 1999 =>60,
    2000 to 2029 =>61,
    2030 to 2059 =>62,
    2060 to 2089 =>63,
    2090 to 2119 =>64,
    2120 to 2149 =>65,
    2150 to 2179 =>66,
    2180 to 2209 =>67,
    2210 to 2239 =>68,
    2240 to 2269 =>69,
    2270 to 2299 =>70,
    2300 to 2329 =>71,
    2330 to 2358 =>72,
    2359 to 2388 =>73,
    2389 to 2418 =>74,
    2419 to 2448 =>75,
    2449 to 2478 =>76,
    2479 to 2508 =>77,
    2509 to 2538 =>78,
    2539 to 2568 =>79,
    2569 to 2598 =>80,
    2599 to 2628 =>81,
    2629 to 2658 =>82,
    2659 to 2688 =>83,
    2689 to 2718 =>84,
    2719 to 2748 =>85,
    2749 to 2778 =>86,
    2779 to 2808 =>87,
    2809 to 2838 =>88,
    2839 to 2868 =>89,
    2869 to 2898 =>90,
    2899 to 2928 =>91,
    2929 to 2958 =>92,
    2959 to 2988 =>93,
    2989 to 3018 =>94,
    3019 to 3048 =>95,
    3049 to 3078 =>96,
    3079 to 3108 =>97,
    3109 to 3138 =>98,
    3139 to 3168 =>99,
    3169 to 3198 =>100,
    3199 to 3228 =>101,
    3229 to 3258 =>102,
    3259 to 3288 =>103,
    3289 to 3318 =>104,
    3319 to 3347 =>105,
    3348 to 3377 =>106,
    3378 to 3407 =>107,
    3408 to 3437 =>108,
    3438 to 3467 =>109,
    3468 to 3497 =>110,
    3498 to 3527 =>111,
    3528 to 3549 =>-1,
    3550 to 3579 =>112,
    3580 to 3609 =>113,
    3610 to 3639 =>114,
    3640 to 3669 =>115,
    3670 to 3699 =>116,
    3700 to 3729 =>117,
    3730 to 3759 =>118,
    3760 to 3789 =>119,
    3790 to 3819 =>120,
    3820 to 3849 =>121,
    3850 to 3879 =>122,
    3880 to 3909 =>123,
    3910 to 3939 =>124,
    3940 to 3969 =>125,
    3970 to 3999 =>126,
    4000 to 4029 =>127,
    4030 to 4058 =>128,
    4059 to 4088 =>129,
    4089 to 4118 =>130,
    4119 to 4148 =>131,
    4149 to 4178 =>132,
    4179 to 4208 =>133,
    4209 to 4238 =>134,
    4239 to 4268 =>135,
    4269 to 4298 =>136,
    4299 to 4328 =>137,
    4329 to 4358 =>138,
    4359 to 4388 =>139,
    4389 to 4418 =>140,
    4419 to 4448 =>141,
    4449 to 4478 =>142,
    4479 to 4508 =>143,
    4509 to 4538 =>144,
    4539 to 4568 =>145,
    4569 to 4598 =>146,
    4599 to 4628 =>147,
    4629 to 4658 =>148,
    4659 to 4688 =>149,
    4689 to 4718 =>150,
    4719 to 4748 =>151,
    4749 to 4778 =>152,
    4779 to 4808 =>153,
    4809 to 4838 =>154,
    4839 to 4868 =>155,
    4869 to 4898 =>156,
    4899 to 4928 =>157,
    4929 to 4958 =>158,
    4959 to 4988 =>159,
    4989 to 5018 =>160,
    5019 to 5048 =>161,
    5049 to 5077 =>162,
    5078 to 5107 =>163,
    5108 to 5137 =>164,
    5138 to 5167 =>165,
    5168 to 5197 =>166,
    5198 to 5227 =>167,
    5228 to 5249 =>-1,
    5250 to 5279 =>168,
    5280 to 5309 =>169,
    5310 to 5339 =>170,
    5340 to 5369 =>171,
    5370 to 5399 =>172,
    5400 to 5429 =>173,
    5430 to 5459 =>174,
    5460 to 5489 =>175,
    5490 to 5519 =>176,
    5520 to 5549 =>177,
    5550 to 5579 =>178,
    5580 to 5609 =>179,
    5610 to 5639 =>180,
    5640 to 5669 =>181,
    5670 to 5699 =>182,
    5700 to 5729 =>183,
    5730 to 5758 =>184,
    5759 to 5788 =>185,
    5789 to 5818 =>186,
    5819 to 5848 =>187,
    5849 to 5878 =>188,
    5879 to 5908 =>189,
    5909 to 5938 =>190,
    5939 to 5968 =>191,
    5969 to 5998 =>192,
    5999 to 6028 =>193,
    6029 to 6058 =>194,
    6059 to 6088 =>195,
    6089 to 6118 =>196,
    6119 to 6148 =>197,
    6149 to 6178 =>198,
    6179 to 6208 =>199,
    6209 to 6238 =>200,
    6239 to 6268 =>201,
    6269 to 6298 =>202,
    6299 to 6328 =>203,
    6329 to 6358 =>204,
    6359 to 6388 =>205,
    6389 to 6418 =>206,
    6419 to 6448 =>207,
    6449 to 6469 =>-1,
    6470 to 6499 =>208,
    6500 to 6529 =>209,
    6530 to 6559 =>210,
    6560 to 6589 =>211,
    6590 to 6619 =>212,
    6620 to 6649 =>213,
    6650 to 6679 =>214,
    6680 to 6709 =>215,
    6710 to 6739 =>216,
    6740 to 6769 =>217,
    6770 to 6799 =>218,
    6800 to 6829 =>219,
    6830 to 6859 =>220,
    6860 to 6889 =>221,
    6890 to 6919 =>222,
    6920 to 6949 =>223,
    6950 to 6978 =>224,
    6979 to 7008 =>225,
    7009 to 7038 =>226,
    7039 to 7068 =>227,
    7069 to 7098 =>228,
    7099 to 7128 =>229,
    7129 to 7158 =>230,
    7159 to 7188 =>231,
    7189 to 7218 =>232,
    7219 to 7248 =>233,
    7249 to 7278 =>234,
    7279 to 7308 =>235,
    7309 to 7338 =>236,
    7339 to 7368 =>237,
    7369 to 7398 =>238,
    7399 to 7428 =>239,
    7429 to 7458 =>240,
    7459 to 7488 =>241,
    7489 to 7518 =>242,
    7519 to 7548 =>243,
    7549 to 7578 =>244,
    7579 to 7608 =>245,
    7609 to 7638 =>246,
    7639 to 7668 =>247,
    7669 to 7689 =>-1,
    7690 to 7719 =>248,
    7720 to 7749 =>249,
    7750 to 7779 =>250,
    7780 to 7809 =>251,
    7810 to 7839 =>252,
    7840 to 7869 =>253,
    7870 to 7899 =>254,
    7900 to 7929 =>255,
    7930 to 7959 =>256,
    7960 to 7989 =>257,
    7990 to 8019 =>258,
    8020 to 8049 =>259,
    8050 to 8079 =>260,
    8080 to 8109 =>261,
    8110 to 8139 =>262,
    8140 to 8169 =>263,
    8170 to 8198 =>264,
    8199 to 8228 =>265,
    8229 to 8258 =>266,
    8259 to 8288 =>267,
    8289 to 8318 =>268,
    8319 to 8348 =>269,
    8349 to 8378 =>270,
    8379 to 8408 =>271,
    8409 to 8438 =>272,
    8439 to 8468 =>273,
    8469 to 8498 =>274,
    8499 to 8528 =>275,
    8529 to 8558 =>276,
    8559 to 8588 =>277,
    8589 to 8618 =>278,
    8619 to 8648 =>279,
    8649 to 8678 =>280,
    8679 to 8708 =>281,
    8709 to 8738 =>282,
    8739 to 8768 =>283,
    8769 to 8798 =>284,
    8799 to 8828 =>285,
    8829 to 8858 =>286,
    8859 to 8888 =>287,
    8889 to 8918 =>288,
    8919 to 8948 =>289,
    8949 to 8978 =>290,
    8979 to 9008 =>291,
    9009 to 9038 =>292,
    9039 to 9068 =>293,
    9069 to 9098 =>294,
    9099 to 9129 =>295
  );

 end package roi_lut_BMLA3;
