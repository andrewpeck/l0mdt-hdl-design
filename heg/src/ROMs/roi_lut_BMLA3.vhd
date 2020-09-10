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

        0 to   149 => (  0,  0),
      150 to   164 => (  0,  0),
      165 to   179 => (  0,  0),
      180 to   194 => (  1,  0),
      195 to   209 => (  1,  1),
      210 to   224 => (  2,  1),
      225 to   239 => (  2,  2),
      240 to   254 => (  3,  2),
      255 to   269 => (  3,  3),
      270 to   284 => (  4,  3),
      285 to   299 => (  4,  4),
      300 to   314 => (  5,  4),
      315 to   329 => (  5,  5),
      330 to   344 => (  6,  5),
      345 to   359 => (  6,  6),
      360 to   374 => (  7,  6),
      375 to   389 => (  7,  7),
      390 to   404 => (  8,  7),
      405 to   419 => (  8,  8),
      420 to   434 => (  9,  8),
      435 to   449 => (  9,  9),
      450 to   464 => ( 10,  9),
      465 to   479 => ( 10, 10),
      480 to   494 => ( 11, 10),
      495 to   509 => ( 11, 11),
      510 to   524 => ( 12, 11),
      525 to   539 => ( 12, 12),
      540 to   554 => ( 13, 12),
      555 to   569 => ( 13, 13),
      570 to   584 => ( 14, 13),
      585 to   599 => ( 14, 14),
      600 to   614 => ( 15, 14),
      615 to   629 => ( 15, 15),
      630 to   644 => ( 16, 15),
      645 to   658 => ( 16, 16),
      659 to   673 => ( 17, 16),
      674 to   688 => ( 17, 17),
      689 to   703 => ( 18, 17),
      704 to   718 => ( 18, 18),
      719 to   733 => ( 19, 18),
      734 to   748 => ( 19, 19),
      749 to   763 => ( 20, 19),
      764 to   778 => ( 20, 20),
      779 to   793 => ( 21, 20),
      794 to   808 => ( 21, 21),
      809 to   823 => ( 22, 21),
      824 to   838 => ( 22, 22),
      839 to   853 => ( 23, 22),
      854 to   868 => ( 23, 23),
      869 to   883 => ( 24, 23),
      884 to   898 => ( 24, 24),
      899 to   913 => ( 25, 24),
      914 to   928 => ( 25, 25),
      929 to   943 => ( 26, 25),
      944 to   958 => ( 26, 26),
      959 to   973 => ( 27, 26),
      974 to   988 => ( 27, 27),
      989 to  1003 => ( 28, 27),
     1004 to  1018 => ( 28, 28),
     1019 to  1033 => ( 29, 28),
     1034 to  1048 => ( 29, 29),
     1049 to  1063 => ( 30, 29),
     1064 to  1078 => ( 30, 30),
     1079 to  1093 => ( 31, 30),
     1094 to  1108 => ( 31, 31),
     1109 to  1123 => ( 32, 31),
     1124 to  1138 => ( 32, 32),
     1139 to  1153 => ( 33, 32),
     1154 to  1168 => ( 33, 33),
     1169 to  1183 => ( 34, 33),
     1184 to  1198 => ( 34, 34),
     1199 to  1213 => ( 35, 34),
     1214 to  1228 => ( 35, 35),
     1229 to  1243 => ( 36, 35),
     1244 to  1258 => ( 36, 36),
     1259 to  1273 => ( 37, 36),
     1274 to  1288 => ( 37, 37),
     1289 to  1303 => ( 38, 37),
     1304 to  1318 => ( 38, 38),
     1319 to  1333 => ( 39, 38),
     1334 to  1348 => ( 39, 39),
     1349 to  1363 => ( 40, 39),
     1364 to  1378 => ( 40, 40),
     1379 to  1393 => ( 41, 40),
     1394 to  1408 => ( 41, 41),
     1409 to  1423 => ( 42, 41),
     1424 to  1438 => ( 42, 42),
     1439 to  1453 => ( 43, 42),
     1454 to  1468 => ( 43, 43),
     1469 to  1483 => ( 44, 43),
     1484 to  1498 => ( 44, 44),
     1499 to  1513 => ( 45, 44),
     1514 to  1528 => ( 45, 45),
     1529 to  1543 => ( 46, 45),
     1544 to  1558 => ( 46, 46),
     1559 to  1573 => ( 47, 46),
     1574 to  1588 => ( 47, 47),
     1589 to  1603 => ( 48, 47),
     1604 to  1618 => ( 48, 48),
     1619 to  1633 => ( 49, 48),
     1634 to  1648 => ( 49, 49),
     1649 to  1662 => ( 50, 49),
     1663 to  1677 => ( 50, 50),
     1678 to  1692 => ( 51, 50),
     1693 to  1707 => ( 51, 51),
     1708 to  1722 => ( 52, 51),
     1723 to  1737 => ( 52, 52),
     1738 to  1752 => ( 53, 52),
     1753 to  1767 => ( 53, 53),
     1768 to  1782 => ( 54, 53),
     1783 to  1797 => ( 54, 54),
     1798 to  1812 => ( 55, 54),
     1813 to  1827 => ( 55, 55),
     1828 to  1849 => ( 56, 55),
     1850 to  1864 => ( 56, 55),
     1865 to  1879 => ( 56, 56),
     1880 to  1894 => ( 57, 56),
     1895 to  1909 => ( 57, 57),
     1910 to  1924 => ( 58, 57),
     1925 to  1939 => ( 58, 58),
     1940 to  1954 => ( 59, 58),
     1955 to  1969 => ( 59, 59),
     1970 to  1984 => ( 60, 59),
     1985 to  1999 => ( 60, 60),
     2000 to  2014 => ( 61, 60),
     2015 to  2029 => ( 61, 61),
     2030 to  2044 => ( 62, 61),
     2045 to  2059 => ( 62, 62),
     2060 to  2074 => ( 63, 62),
     2075 to  2089 => ( 63, 63),
     2090 to  2104 => ( 64, 63),
     2105 to  2119 => ( 64, 64),
     2120 to  2134 => ( 65, 64),
     2135 to  2149 => ( 65, 65),
     2150 to  2164 => ( 66, 65),
     2165 to  2179 => ( 66, 66),
     2180 to  2194 => ( 67, 66),
     2195 to  2209 => ( 67, 67),
     2210 to  2224 => ( 68, 67),
     2225 to  2239 => ( 68, 68),
     2240 to  2254 => ( 69, 68),
     2255 to  2269 => ( 69, 69),
     2270 to  2284 => ( 70, 69),
     2285 to  2299 => ( 70, 70),
     2300 to  2314 => ( 71, 70),
     2315 to  2329 => ( 71, 71),
     2330 to  2344 => ( 72, 71),
     2345 to  2358 => ( 72, 72),
     2359 to  2373 => ( 73, 72),
     2374 to  2388 => ( 73, 73),
     2389 to  2403 => ( 74, 73),
     2404 to  2418 => ( 74, 74),
     2419 to  2433 => ( 75, 74),
     2434 to  2448 => ( 75, 75),
     2449 to  2463 => ( 76, 75),
     2464 to  2478 => ( 76, 76),
     2479 to  2493 => ( 77, 76),
     2494 to  2508 => ( 77, 77),
     2509 to  2523 => ( 78, 77),
     2524 to  2538 => ( 78, 78),
     2539 to  2553 => ( 79, 78),
     2554 to  2568 => ( 79, 79),
     2569 to  2583 => ( 80, 79),
     2584 to  2598 => ( 80, 80),
     2599 to  2613 => ( 81, 80),
     2614 to  2628 => ( 81, 81),
     2629 to  2643 => ( 82, 81),
     2644 to  2658 => ( 82, 82),
     2659 to  2673 => ( 83, 82),
     2674 to  2688 => ( 83, 83),
     2689 to  2703 => ( 84, 83),
     2704 to  2718 => ( 84, 84),
     2719 to  2733 => ( 85, 84),
     2734 to  2748 => ( 85, 85),
     2749 to  2763 => ( 86, 85),
     2764 to  2778 => ( 86, 86),
     2779 to  2793 => ( 87, 86),
     2794 to  2808 => ( 87, 87),
     2809 to  2823 => ( 88, 87),
     2824 to  2838 => ( 88, 88),
     2839 to  2853 => ( 89, 88),
     2854 to  2868 => ( 89, 89),
     2869 to  2883 => ( 90, 89),
     2884 to  2898 => ( 90, 90),
     2899 to  2913 => ( 91, 90),
     2914 to  2928 => ( 91, 91),
     2929 to  2943 => ( 92, 91),
     2944 to  2958 => ( 92, 92),
     2959 to  2973 => ( 93, 92),
     2974 to  2988 => ( 93, 93),
     2989 to  3003 => ( 94, 93),
     3004 to  3018 => ( 94, 94),
     3019 to  3033 => ( 95, 94),
     3034 to  3048 => ( 95, 95),
     3049 to  3063 => ( 96, 95),
     3064 to  3078 => ( 96, 96),
     3079 to  3093 => ( 97, 96),
     3094 to  3108 => ( 97, 97),
     3109 to  3123 => ( 98, 97),
     3124 to  3138 => ( 98, 98),
     3139 to  3153 => ( 99, 98),
     3154 to  3168 => ( 99, 99),
     3169 to  3183 => (100, 99),
     3184 to  3198 => (100,100),
     3199 to  3213 => (101,100),
     3214 to  3228 => (101,101),
     3229 to  3243 => (102,101),
     3244 to  3258 => (102,102),
     3259 to  3273 => (103,102),
     3274 to  3288 => (103,103),
     3289 to  3303 => (104,103),
     3304 to  3318 => (104,104),
     3319 to  3333 => (105,104),
     3334 to  3347 => (105,105),
     3348 to  3362 => (106,105),
     3363 to  3377 => (106,106),
     3378 to  3392 => (107,106),
     3393 to  3407 => (107,107),
     3408 to  3422 => (108,107),
     3423 to  3437 => (108,108),
     3438 to  3452 => (109,108),
     3453 to  3467 => (109,109),
     3468 to  3482 => (110,109),
     3483 to  3497 => (110,110),
     3498 to  3512 => (111,110),
     3513 to  3527 => (111,111),
     3528 to  3549 => (112,111),
     3550 to  3564 => (112,111),
     3565 to  3579 => (112,112),
     3580 to  3594 => (113,112),
     3595 to  3609 => (113,113),
     3610 to  3624 => (114,113),
     3625 to  3639 => (114,114),
     3640 to  3654 => (115,114),
     3655 to  3669 => (115,115),
     3670 to  3684 => (116,115),
     3685 to  3699 => (116,116),
     3700 to  3714 => (117,116),
     3715 to  3729 => (117,117),
     3730 to  3744 => (118,117),
     3745 to  3759 => (118,118),
     3760 to  3774 => (119,118),
     3775 to  3789 => (119,119),
     3790 to  3804 => (120,119),
     3805 to  3819 => (120,120),
     3820 to  3834 => (121,120),
     3835 to  3849 => (121,121),
     3850 to  3864 => (122,121),
     3865 to  3879 => (122,122),
     3880 to  3894 => (123,122),
     3895 to  3909 => (123,123),
     3910 to  3924 => (124,123),
     3925 to  3939 => (124,124),
     3940 to  3954 => (125,124),
     3955 to  3969 => (125,125),
     3970 to  3984 => (126,125),
     3985 to  3999 => (126,126),
     4000 to  4014 => (127,126),
     4015 to  4029 => (127,127),
     4030 to  4044 => (128,127),
     4045 to  4058 => (128,128),
     4059 to  4073 => (129,128),
     4074 to  4088 => (129,129),
     4089 to  4103 => (130,129),
     4104 to  4118 => (130,130),
     4119 to  4133 => (131,130),
     4134 to  4148 => (131,131),
     4149 to  4163 => (132,131),
     4164 to  4178 => (132,132),
     4179 to  4193 => (133,132),
     4194 to  4208 => (133,133),
     4209 to  4223 => (134,133),
     4224 to  4238 => (134,134),
     4239 to  4253 => (135,134),
     4254 to  4268 => (135,135),
     4269 to  4283 => (136,135),
     4284 to  4298 => (136,136),
     4299 to  4313 => (137,136),
     4314 to  4328 => (137,137),
     4329 to  4343 => (138,137),
     4344 to  4358 => (138,138),
     4359 to  4373 => (139,138),
     4374 to  4388 => (139,139),
     4389 to  4403 => (140,139),
     4404 to  4418 => (140,140),
     4419 to  4433 => (141,140),
     4434 to  4448 => (141,141),
     4449 to  4463 => (142,141),
     4464 to  4478 => (142,142),
     4479 to  4493 => (143,142),
     4494 to  4508 => (143,143),
     4509 to  4523 => (144,143),
     4524 to  4538 => (144,144),
     4539 to  4553 => (145,144),
     4554 to  4568 => (145,145),
     4569 to  4583 => (146,145),
     4584 to  4598 => (146,146),
     4599 to  4613 => (147,146),
     4614 to  4628 => (147,147),
     4629 to  4643 => (148,147),
     4644 to  4658 => (148,148),
     4659 to  4673 => (149,148),
     4674 to  4688 => (149,149),
     4689 to  4703 => (150,149),
     4704 to  4718 => (150,150),
     4719 to  4733 => (151,150),
     4734 to  4748 => (151,151),
     4749 to  4763 => (152,151),
     4764 to  4778 => (152,152),
     4779 to  4793 => (153,152),
     4794 to  4808 => (153,153),
     4809 to  4823 => (154,153),
     4824 to  4838 => (154,154),
     4839 to  4853 => (155,154),
     4854 to  4868 => (155,155),
     4869 to  4883 => (156,155),
     4884 to  4898 => (156,156),
     4899 to  4913 => (157,156),
     4914 to  4928 => (157,157),
     4929 to  4943 => (158,157),
     4944 to  4958 => (158,158),
     4959 to  4973 => (159,158),
     4974 to  4988 => (159,159),
     4989 to  5003 => (160,159),
     5004 to  5018 => (160,160),
     5019 to  5033 => (161,160),
     5034 to  5048 => (161,161),
     5049 to  5062 => (162,161),
     5063 to  5077 => (162,162),
     5078 to  5092 => (163,162),
     5093 to  5107 => (163,163),
     5108 to  5122 => (164,163),
     5123 to  5137 => (164,164),
     5138 to  5152 => (165,164),
     5153 to  5167 => (165,165),
     5168 to  5182 => (166,165),
     5183 to  5197 => (166,166),
     5198 to  5212 => (167,166),
     5213 to  5227 => (167,167),
     5228 to  5249 => (168,167),
     5250 to  5264 => (168,167),
     5265 to  5279 => (168,168),
     5280 to  5294 => (169,168),
     5295 to  5309 => (169,169),
     5310 to  5324 => (170,169),
     5325 to  5339 => (170,170),
     5340 to  5354 => (171,170),
     5355 to  5369 => (171,171),
     5370 to  5384 => (172,171),
     5385 to  5399 => (172,172),
     5400 to  5414 => (173,172),
     5415 to  5429 => (173,173),
     5430 to  5444 => (174,173),
     5445 to  5459 => (174,174),
     5460 to  5474 => (175,174),
     5475 to  5489 => (175,175),
     5490 to  5504 => (176,175),
     5505 to  5519 => (176,176),
     5520 to  5534 => (177,176),
     5535 to  5549 => (177,177),
     5550 to  5564 => (178,177),
     5565 to  5579 => (178,178),
     5580 to  5594 => (179,178),
     5595 to  5609 => (179,179),
     5610 to  5624 => (180,179),
     5625 to  5639 => (180,180),
     5640 to  5654 => (181,180),
     5655 to  5669 => (181,181),
     5670 to  5684 => (182,181),
     5685 to  5699 => (182,182),
     5700 to  5714 => (183,182),
     5715 to  5729 => (183,183),
     5730 to  5744 => (184,183),
     5745 to  5758 => (184,184),
     5759 to  5773 => (185,184),
     5774 to  5788 => (185,185),
     5789 to  5803 => (186,185),
     5804 to  5818 => (186,186),
     5819 to  5833 => (187,186),
     5834 to  5848 => (187,187),
     5849 to  5863 => (188,187),
     5864 to  5878 => (188,188),
     5879 to  5893 => (189,188),
     5894 to  5908 => (189,189),
     5909 to  5923 => (190,189),
     5924 to  5938 => (190,190),
     5939 to  5953 => (191,190),
     5954 to  5968 => (191,191),
     5969 to  5983 => (192,191),
     5984 to  5998 => (192,192),
     5999 to  6013 => (193,192),
     6014 to  6028 => (193,193),
     6029 to  6043 => (194,193),
     6044 to  6058 => (194,194),
     6059 to  6073 => (195,194),
     6074 to  6088 => (195,195),
     6089 to  6103 => (196,195),
     6104 to  6118 => (196,196),
     6119 to  6133 => (197,196),
     6134 to  6148 => (197,197),
     6149 to  6163 => (198,197),
     6164 to  6178 => (198,198),
     6179 to  6193 => (199,198),
     6194 to  6208 => (199,199),
     6209 to  6223 => (200,199),
     6224 to  6238 => (200,200),
     6239 to  6253 => (201,200),
     6254 to  6268 => (201,201),
     6269 to  6283 => (202,201),
     6284 to  6298 => (202,202),
     6299 to  6313 => (203,202),
     6314 to  6328 => (203,203),
     6329 to  6343 => (204,203),
     6344 to  6358 => (204,204),
     6359 to  6373 => (205,204),
     6374 to  6388 => (205,205),
     6389 to  6403 => (206,205),
     6404 to  6418 => (206,206),
     6419 to  6433 => (207,206),
     6434 to  6448 => (207,207),
     6449 to  6469 => (208,207),
     6470 to  6484 => (208,207),
     6485 to  6499 => (208,208),
     6500 to  6514 => (209,208),
     6515 to  6529 => (209,209),
     6530 to  6544 => (210,209),
     6545 to  6559 => (210,210),
     6560 to  6574 => (211,210),
     6575 to  6589 => (211,211),
     6590 to  6604 => (212,211),
     6605 to  6619 => (212,212),
     6620 to  6634 => (213,212),
     6635 to  6649 => (213,213),
     6650 to  6664 => (214,213),
     6665 to  6679 => (214,214),
     6680 to  6694 => (215,214),
     6695 to  6709 => (215,215),
     6710 to  6724 => (216,215),
     6725 to  6739 => (216,216),
     6740 to  6754 => (217,216),
     6755 to  6769 => (217,217),
     6770 to  6784 => (218,217),
     6785 to  6799 => (218,218),
     6800 to  6814 => (219,218),
     6815 to  6829 => (219,219),
     6830 to  6844 => (220,219),
     6845 to  6859 => (220,220),
     6860 to  6874 => (221,220),
     6875 to  6889 => (221,221),
     6890 to  6904 => (222,221),
     6905 to  6919 => (222,222),
     6920 to  6934 => (223,222),
     6935 to  6949 => (223,223),
     6950 to  6964 => (224,223),
     6965 to  6978 => (224,224),
     6979 to  6993 => (225,224),
     6994 to  7008 => (225,225),
     7009 to  7023 => (226,225),
     7024 to  7038 => (226,226),
     7039 to  7053 => (227,226),
     7054 to  7068 => (227,227),
     7069 to  7083 => (228,227),
     7084 to  7098 => (228,228),
     7099 to  7113 => (229,228),
     7114 to  7128 => (229,229),
     7129 to  7143 => (230,229),
     7144 to  7158 => (230,230),
     7159 to  7173 => (231,230),
     7174 to  7188 => (231,231),
     7189 to  7203 => (232,231),
     7204 to  7218 => (232,232),
     7219 to  7233 => (233,232),
     7234 to  7248 => (233,233),
     7249 to  7263 => (234,233),
     7264 to  7278 => (234,234),
     7279 to  7293 => (235,234),
     7294 to  7308 => (235,235),
     7309 to  7323 => (236,235),
     7324 to  7338 => (236,236),
     7339 to  7353 => (237,236),
     7354 to  7368 => (237,237),
     7369 to  7383 => (238,237),
     7384 to  7398 => (238,238),
     7399 to  7413 => (239,238),
     7414 to  7428 => (239,239),
     7429 to  7443 => (240,239),
     7444 to  7458 => (240,240),
     7459 to  7473 => (241,240),
     7474 to  7488 => (241,241),
     7489 to  7503 => (242,241),
     7504 to  7518 => (242,242),
     7519 to  7533 => (243,242),
     7534 to  7548 => (243,243),
     7549 to  7563 => (244,243),
     7564 to  7578 => (244,244),
     7579 to  7593 => (245,244),
     7594 to  7608 => (245,245),
     7609 to  7623 => (246,245),
     7624 to  7638 => (246,246),
     7639 to  7653 => (247,246),
     7654 to  7668 => (247,247),
     7669 to  7689 => (248,247),
     7690 to  7704 => (248,247),
     7705 to  7719 => (248,248),
     7720 to  7734 => (249,248),
     7735 to  7749 => (249,249),
     7750 to  7764 => (250,249),
     7765 to  7779 => (250,250),
     7780 to  7794 => (251,250),
     7795 to  7809 => (251,251),
     7810 to  7824 => (252,251),
     7825 to  7839 => (252,252),
     7840 to  7854 => (253,252),
     7855 to  7869 => (253,253),
     7870 to  7884 => (254,253),
     7885 to  7899 => (254,254),
     7900 to  7914 => (255,254),
     7915 to  7929 => (255,255),
     7930 to  7944 => (256,255),
     7945 to  7959 => (256,256),
     7960 to  7974 => (257,256),
     7975 to  7989 => (257,257),
     7990 to  8004 => (258,257),
     8005 to  8019 => (258,258),
     8020 to  8034 => (259,258),
     8035 to  8049 => (259,259),
     8050 to  8064 => (260,259),
     8065 to  8079 => (260,260),
     8080 to  8094 => (261,260),
     8095 to  8109 => (261,261),
     8110 to  8124 => (262,261),
     8125 to  8139 => (262,262),
     8140 to  8154 => (263,262),
     8155 to  8169 => (263,263),
     8170 to  8184 => (264,263),
     8185 to  8198 => (264,264),
     8199 to  8213 => (265,264),
     8214 to  8228 => (265,265),
     8229 to  8243 => (266,265),
     8244 to  8258 => (266,266),
     8259 to  8273 => (267,266),
     8274 to  8288 => (267,267),
     8289 to  8303 => (268,267),
     8304 to  8318 => (268,268),
     8319 to  8333 => (269,268),
     8334 to  8348 => (269,269),
     8349 to  8363 => (270,269),
     8364 to  8378 => (270,270),
     8379 to  8393 => (271,270),
     8394 to  8408 => (271,271),
     8409 to  8423 => (272,271),
     8424 to  8438 => (272,272),
     8439 to  8453 => (273,272),
     8454 to  8468 => (273,273),
     8469 to  8483 => (274,273),
     8484 to  8498 => (274,274),
     8499 to  8513 => (275,274),
     8514 to  8528 => (275,275),
     8529 to  8543 => (276,275),
     8544 to  8558 => (276,276),
     8559 to  8573 => (277,276),
     8574 to  8588 => (277,277),
     8589 to  8603 => (278,277),
     8604 to  8618 => (278,278),
     8619 to  8633 => (279,278),
     8634 to  8648 => (279,279),
     8649 to  8663 => (280,279),
     8664 to  8678 => (280,280),
     8679 to  8693 => (281,280),
     8694 to  8708 => (281,281),
     8709 to  8723 => (282,281),
     8724 to  8738 => (282,282),
     8739 to  8753 => (283,282),
     8754 to  8768 => (283,283),
     8769 to  8783 => (284,283),
     8784 to  8798 => (284,284),
     8799 to  8813 => (285,284),
     8814 to  8828 => (285,285),
     8829 to  8843 => (286,285),
     8844 to  8858 => (286,286),
     8859 to  8873 => (287,286),
     8874 to  8888 => (287,287),
     8889 to  8903 => (288,287),
     8904 to  8918 => (288,288),
     8919 to  8933 => (289,288),
     8934 to  8948 => (289,289),
     8949 to  8963 => (290,289),
     8964 to  8978 => (290,290),
     8979 to  8993 => (291,290),
     8994 to  9008 => (291,291),
     9009 to  9023 => (292,291),
     9024 to  9038 => (292,292),
     9039 to  9053 => (293,292),
     9054 to  9068 => (293,293),
     9069 to  9083 => (294,293),
     9084 to  9098 => (294,294),
     9099 to  9113 => (295,294),
     9114 to  9129 => (295,295)
  );

 end package roi_lut_BMLA3;
