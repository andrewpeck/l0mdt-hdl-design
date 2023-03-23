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

package roi_lut_BOLA3 is

    -- add length of constant array
    constant ROM_BOLA3_Z_MAX_SIZE : integer := 12249;

    constant ROI_BOLA3_Z_MEM : roi_z_lut_t(0 to ROM_BOLA3_Z_MAX_SIZE - 1) := (
  
        0 to   149 => (   0,  0),
      150 to   179 => (   0,  0),
      180 to   209 => (   1,  1),
      210 to   239 => (   2,  2),
      240 to   269 => (   3,  3),
      270 to   299 => (   4,  4),
      300 to   329 => (   5,  5),
      330 to   359 => (   6,  6),
      360 to   389 => (   7,  7),
      390 to   419 => (   8,  8),
      420 to   449 => (   9,  9),
      450 to   479 => (  10, 10),
      480 to   509 => (  11, 11),
      510 to   539 => (  12, 12),
      540 to   569 => (  13, 13),
      570 to   599 => (  14, 14),
      600 to   629 => (  15, 15),
      630 to   658 => (  16, 16),
      659 to   688 => (  17, 17),
      689 to   718 => (  18, 18),
      719 to   748 => (  19, 19),
      749 to   778 => (  20, 20),
      779 to   808 => (  21, 21),
      809 to   838 => (  22, 22),
      839 to   868 => (  23, 23),
      869 to   898 => (  24, 24),
      899 to   928 => (  25, 25),
      929 to   958 => (  26, 26),
      959 to   988 => (  27, 27),
      989 to  1018 => (  28, 28),
     1019 to  1048 => (  29, 29),
     1049 to  1078 => (  30, 30),
     1079 to  1108 => (  31, 31),
     1109 to  1138 => (  32, 32),
     1139 to  1168 => (  33, 33),
     1169 to  1198 => (  34, 34),
     1199 to  1228 => (  35, 35),
     1229 to  1258 => (  36, 36),
     1259 to  1288 => (  37, 37),
     1289 to  1318 => (  38, 38),
     1319 to  1348 => (  39, 39),
     1349 to  1378 => (  40, 40),
     1379 to  1408 => (  41, 41),
     1409 to  1438 => (  42, 42),
     1439 to  1468 => (  43, 43),
     1469 to  1498 => (  44, 44),
     1499 to  1528 => (  45, 45),
     1529 to  1558 => (  46, 46),
     1559 to  1588 => (  47, 47),
     1589 to  1618 => (  48, 48),
     1619 to  1648 => (  49, 49),
     1649 to  1677 => (  50, 50),
     1678 to  1707 => (  51, 51),
     1708 to  1737 => (  52, 52),
     1738 to  1767 => (  53, 53),
     1768 to  1797 => (  54, 54),
     1798 to  1827 => (  55, 55),
     1828 to  1857 => (  56, 56),
     1858 to  1887 => (  57, 57),
     1888 to  1917 => (  58, 58),
     1918 to  1947 => (  59, 59),
     1948 to  1977 => (  60, 60),
     1978 to  2007 => (  61, 61),
     2008 to  2037 => (  62, 62),
     2038 to  2067 => (  63, 63),
     2068 to  2097 => (  64, 64),
     2098 to  2127 => (  65, 65),
     2128 to  2157 => (  66, 66),
     2158 to  2187 => (  67, 67),
     2188 to  2217 => (  68, 68),
     2218 to  2247 => (  69, 69),
     2248 to  2277 => (  70, 70),
     2278 to  2307 => (  71, 71),
     2308 to  2329 => (  -1, -1),
     2330 to  2359 => (  72, 72),
     2360 to  2389 => (  73, 73),
     2390 to  2419 => (  74, 74),
     2420 to  2449 => (  75, 75),
     2450 to  2479 => (  76, 76),
     2480 to  2509 => (  77, 77),
     2510 to  2539 => (  78, 78),
     2540 to  2569 => (  79, 79),
     2570 to  2599 => (  80, 80),
     2600 to  2629 => (  81, 81),
     2630 to  2659 => (  82, 82),
     2660 to  2689 => (  83, 83),
     2690 to  2719 => (  84, 84),
     2720 to  2749 => (  85, 85),
     2750 to  2779 => (  86, 86),
     2780 to  2809 => (  87, 87),
     2810 to  2838 => (  88, 88),
     2839 to  2868 => (  89, 89),
     2869 to  2898 => (  90, 90),
     2899 to  2928 => (  91, 91),
     2929 to  2958 => (  92, 92),
     2959 to  2988 => (  93, 93),
     2989 to  3018 => (  94, 94),
     3019 to  3048 => (  95, 95),
     3049 to  3078 => (  96, 96),
     3079 to  3108 => (  97, 97),
     3109 to  3138 => (  98, 98),
     3139 to  3168 => (  99, 99),
     3169 to  3198 => ( 100,100),
     3199 to  3228 => ( 101,101),
     3229 to  3258 => ( 102,102),
     3259 to  3288 => ( 103,103),
     3289 to  3318 => ( 104,104),
     3319 to  3348 => ( 105,105),
     3349 to  3378 => ( 106,106),
     3379 to  3408 => ( 107,107),
     3409 to  3438 => ( 108,108),
     3439 to  3468 => ( 109,109),
     3469 to  3498 => ( 110,110),
     3499 to  3528 => ( 111,111),
     3529 to  3558 => ( 112,112),
     3559 to  3588 => ( 113,113),
     3589 to  3618 => ( 114,114),
     3619 to  3648 => ( 115,115),
     3649 to  3678 => ( 116,116),
     3679 to  3708 => ( 117,117),
     3709 to  3738 => ( 118,118),
     3739 to  3768 => ( 119,119),
     3769 to  3798 => ( 120,120),
     3799 to  3827 => ( 121,121),
     3828 to  3857 => ( 122,122),
     3858 to  3887 => ( 123,123),
     3888 to  3917 => ( 124,124),
     3918 to  3947 => ( 125,125),
     3948 to  3977 => ( 126,126),
     3978 to  4007 => ( 127,127),
     4008 to  4037 => ( 128,128),
     4038 to  4067 => ( 129,129),
     4068 to  4097 => ( 130,130),
     4098 to  4127 => ( 131,131),
     4128 to  4157 => ( 132,132),
     4158 to  4187 => ( 133,133),
     4188 to  4217 => ( 134,134),
     4218 to  4247 => ( 135,135),
     4248 to  4277 => ( 136,136),
     4278 to  4307 => ( 137,137),
     4308 to  4337 => ( 138,138),
     4338 to  4367 => ( 139,139),
     4368 to  4397 => ( 140,140),
     4398 to  4427 => ( 141,141),
     4428 to  4457 => ( 142,142),
     4458 to  4487 => ( 143,143),
     4488 to  4509 => ( 143,143),
     4510 to  4539 => ( 144,144),
     4540 to  4569 => ( 145,145),
     4570 to  4599 => ( 146,146),
     4600 to  4629 => ( 147,147),
     4630 to  4659 => ( 148,148),
     4660 to  4689 => ( 149,149),
     4690 to  4719 => ( 150,150),
     4720 to  4749 => ( 151,151),
     4750 to  4779 => ( 152,152),
     4780 to  4809 => ( 153,153),
     4810 to  4839 => ( 154,154),
     4840 to  4869 => ( 155,155),
     4870 to  4899 => ( 156,156),
     4900 to  4929 => ( 157,157),
     4930 to  4959 => ( 158,158),
     4960 to  4989 => ( 159,159),
     4990 to  5018 => ( 160,160),
     5019 to  5048 => ( 161,161),
     5049 to  5078 => ( 162,162),
     5079 to  5108 => ( 163,163),
     5109 to  5138 => ( 164,164),
     5139 to  5168 => ( 165,165),
     5169 to  5198 => ( 166,166),
     5199 to  5228 => ( 167,167),
     5229 to  5258 => ( 168,168),
     5259 to  5288 => ( 169,169),
     5289 to  5318 => ( 170,170),
     5319 to  5348 => ( 171,171),
     5349 to  5378 => ( 172,172),
     5379 to  5408 => ( 173,173),
     5409 to  5438 => ( 174,174),
     5439 to  5468 => ( 175,175),
     5469 to  5498 => ( 176,176),
     5499 to  5528 => ( 177,177),
     5529 to  5558 => ( 178,178),
     5559 to  5588 => ( 179,179),
     5589 to  5618 => ( 180,180),
     5619 to  5648 => ( 181,181),
     5649 to  5678 => ( 182,182),
     5679 to  5708 => ( 183,183),
     5709 to  5738 => ( 184,184),
     5739 to  5768 => ( 185,185),
     5769 to  5798 => ( 186,186),
     5799 to  5828 => ( 187,187),
     5829 to  5858 => ( 188,188),
     5859 to  5888 => ( 189,189),
     5889 to  5918 => ( 190,190),
     5919 to  5948 => ( 191,191),
     5949 to  5978 => ( 192,192),
     5979 to  6008 => ( 193,193),
     6009 to  6037 => ( 194,194),
     6038 to  6067 => ( 195,195),
     6068 to  6097 => ( 196,196),
     6098 to  6127 => ( 197,197),
     6128 to  6157 => ( 198,198),
     6158 to  6187 => ( 199,199),
     6188 to  6209 => ( 199,199),
     6210 to  6239 => ( 200,200),
     6240 to  6269 => ( 201,201),
     6270 to  6299 => ( 202,202),
     6300 to  6329 => ( 203,203),
     6330 to  6359 => ( 204,204),
     6360 to  6389 => ( 205,205),
     6390 to  6419 => ( 206,206),
     6420 to  6449 => ( 207,207),
     6450 to  6479 => ( 208,208),
     6480 to  6509 => ( 209,209),
     6510 to  6539 => ( 210,210),
     6540 to  6569 => ( 211,211),
     6570 to  6599 => ( 212,212),
     6600 to  6629 => ( 213,213),
     6630 to  6659 => ( 214,214),
     6660 to  6689 => ( 215,215),
     6690 to  6718 => ( 216,216),
     6719 to  6748 => ( 217,217),
     6749 to  6778 => ( 218,218),
     6779 to  6808 => ( 219,219),
     6809 to  6838 => ( 220,220),
     6839 to  6868 => ( 221,221),
     6869 to  6898 => ( 222,222),
     6899 to  6928 => ( 223,223),
     6929 to  6958 => ( 224,224),
     6959 to  6988 => ( 225,225),
     6989 to  7018 => ( 226,226),
     7019 to  7048 => ( 227,227),
     7049 to  7078 => ( 228,228),
     7079 to  7108 => ( 229,229),
     7109 to  7138 => ( 230,230),
     7139 to  7168 => ( 231,231),
     7169 to  7198 => ( 232,232),
     7199 to  7228 => ( 233,233),
     7229 to  7258 => ( 234,234),
     7259 to  7288 => ( 235,235),
     7289 to  7318 => ( 236,236),
     7319 to  7348 => ( 237,237),
     7349 to  7378 => ( 238,238),
     7379 to  7408 => ( 239,239),
     7409 to  7438 => ( 240,240),
     7439 to  7468 => ( 241,241),
     7469 to  7498 => ( 242,242),
     7499 to  7528 => ( 243,243),
     7529 to  7558 => ( 244,244),
     7559 to  7588 => ( 245,245),
     7589 to  7618 => ( 246,246),
     7619 to  7648 => ( 247,247),
     7649 to  7678 => ( 248,248),
     7679 to  7708 => ( 249,249),
     7709 to  7737 => ( 250,250),
     7738 to  7767 => ( 251,251),
     7768 to  7797 => ( 252,252),
     7798 to  7827 => ( 253,253),
     7828 to  7857 => ( 254,254),
     7858 to  7887 => ( 255,255),
     7888 to  7917 => ( 256,256),
     7918 to  7947 => ( 257,257),
     7948 to  7977 => ( 258,258),
     7978 to  8007 => ( 259,259),
     8008 to  8037 => ( 260,260),
     8038 to  8067 => ( 261,261),
     8068 to  8097 => ( 262,262),
     8098 to  8127 => ( 263,263),
     8128 to  8157 => ( 264,264),
     8158 to  8187 => ( 265,265),
     8188 to  8217 => ( 266,266),
     8218 to  8247 => ( 267,267),
     8248 to  8277 => ( 268,268),
     8278 to  8307 => ( 269,269),
     8308 to  8337 => ( 270,270),
     8338 to  8367 => ( 271,271),
     8368 to  8389 => ( 271,271),
     8390 to  8419 => ( 272,272),
     8420 to  8449 => ( 273,273),
     8450 to  8479 => ( 274,274),
     8480 to  8509 => ( 275,275),
     8510 to  8539 => ( 276,276),
     8540 to  8569 => ( 277,277),
     8570 to  8599 => ( 278,278),
     8600 to  8629 => ( 279,279),
     8630 to  8659 => ( 280,280),
     8660 to  8689 => ( 281,281),
     8690 to  8719 => ( 282,282),
     8720 to  8749 => ( 283,283),
     8750 to  8779 => ( 284,284),
     8780 to  8809 => ( 285,285),
     8810 to  8839 => ( 286,286),
     8840 to  8869 => ( 287,287),
     8870 to  8898 => ( 288,288),
     8899 to  8928 => ( 289,289),
     8929 to  8958 => ( 290,290),
     8959 to  8988 => ( 291,291),
     8989 to  9018 => ( 292,292),
     9019 to  9048 => ( 293,293),
     9049 to  9078 => ( 294,294),
     9079 to  9108 => ( 295,295),
     9109 to  9138 => ( 296,296),
     9139 to  9168 => ( 297,297),
     9169 to  9198 => ( 298,298),
     9199 to  9228 => ( 299,299),
     9229 to  9258 => ( 300,300),
     9259 to  9288 => ( 301,301),
     9289 to  9318 => ( 302,302),
     9319 to  9348 => ( 303,303),
     9349 to  9378 => ( 304,304),
     9379 to  9408 => ( 305,305),
     9409 to  9438 => ( 306,306),
     9439 to  9468 => ( 307,307),
     9469 to  9498 => ( 308,308),
     9499 to  9528 => ( 309,309),
     9529 to  9558 => ( 310,310),
     9559 to  9588 => ( 311,311),
     9589 to  9618 => ( 312,312),
     9619 to  9648 => ( 313,313),
     9649 to  9678 => ( 314,314),
     9679 to  9708 => ( 315,315),
     9709 to  9738 => ( 316,316),
     9739 to  9768 => ( 317,317),
     9769 to  9798 => ( 318,318),
     9799 to  9828 => ( 319,319),
     9829 to  9858 => ( 320,320),
     9859 to  9887 => ( 321,321),
     9888 to  9917 => ( 322,322),
     9918 to  9947 => ( 323,323),
     9948 to  9977 => ( 324,324),
     9978 to 10007 => ( 325,325),
    10008 to 10037 => ( 326,326),
    10038 to 10067 => ( 327,327),
    10068 to 10097 => ( 328,328),
    10098 to 10127 => ( 329,329),
    10128 to 10157 => ( 330,330),
    10158 to 10187 => ( 331,331),
    10188 to 10217 => ( 332,332),
    10218 to 10247 => ( 333,333),
    10248 to 10277 => ( 334,334),
    10278 to 10307 => ( 335,335),
    10308 to 10337 => ( 336,336),
    10338 to 10367 => ( 337,337),
    10368 to 10397 => ( 338,338),
    10398 to 10427 => ( 339,339),
    10428 to 10457 => ( 340,340),
    10458 to 10487 => ( 341,341),
    10488 to 10517 => ( 342,342),
    10518 to 10547 => ( 343,343),
    10548 to 10569 => ( 343,343),
    10570 to 10599 => ( 344,344),
    10600 to 10629 => ( 345,345),
    10630 to 10659 => ( 346,346),
    10660 to 10689 => ( 347,347),
    10690 to 10719 => ( 348,348),
    10720 to 10749 => ( 349,349),
    10750 to 10779 => ( 350,350),
    10780 to 10809 => ( 351,351),
    10810 to 10839 => ( 352,352),
    10840 to 10869 => ( 353,353),
    10870 to 10899 => ( 354,354),
    10900 to 10929 => ( 355,355),
    10930 to 10959 => ( 356,356),
    10960 to 10989 => ( 357,357),
    10990 to 11019 => ( 358,358),
    11020 to 11049 => ( 359,359),
    11050 to 11078 => ( 360,360),
    11079 to 11108 => ( 361,361),
    11109 to 11138 => ( 362,362),
    11139 to 11168 => ( 363,363),
    11169 to 11198 => ( 364,364),
    11199 to 11228 => ( 365,365),
    11229 to 11258 => ( 366,366),
    11259 to 11288 => ( 367,367),
    11289 to 11318 => ( 368,368),
    11319 to 11348 => ( 369,369),
    11349 to 11378 => ( 370,370),
    11379 to 11408 => ( 371,371),
    11409 to 11438 => ( 372,372),
    11439 to 11468 => ( 373,373),
    11469 to 11498 => ( 374,374),
    11499 to 11528 => ( 375,375),
    11529 to 11558 => ( 376,376),
    11559 to 11588 => ( 377,377),
    11589 to 11618 => ( 378,378),
    11619 to 11648 => ( 379,379),
    11649 to 11678 => ( 380,380),
    11679 to 11708 => ( 381,381),
    11709 to 11738 => ( 382,382),
    11739 to 11768 => ( 383,383),
    11769 to 11798 => ( 384,384),
    11799 to 11828 => ( 385,385),
    11829 to 11858 => ( 386,386),
    11859 to 11888 => ( 387,387),
    11889 to 11918 => ( 388,388),
    11919 to 11948 => ( 389,389),
    11949 to 11978 => ( 390,390),
    11979 to 12008 => ( 391,391),
    12009 to 12038 => ( 392,392),
    12039 to 12067 => ( 393,393),
    12068 to 12097 => ( 394,394),
    12098 to 12127 => ( 395,395),
    12128 to 12157 => ( 396,396),
    12158 to 12187 => ( 397,397),
    12188 to 12217 => ( 398,398),
    12218 to 12248 => ( 399,399)
  );

 end package roi_lut_BOLA3;