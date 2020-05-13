-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity get_trig_vals_cos_tables_low_V_12_rom is 
    generic(
             DWIDTH     : integer := 16; 
             AWIDTH     : integer := 10; 
             MEM_SIZE    : integer := 786
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of get_trig_vals_cos_tables_low_V_12_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "1111111111101011", 1 => "1111111110010101", 2 => "1111111011111100", 
    3 => "1111111000100000", 4 => "1111110100000001", 5 => "1111101110100000", 
    6 => "1111100111111011", 7 => "1111100000010011", 8 => "1111010111101000", 
    9 => "1111001101111011", 10 => "1111000011001010", 11 => "1110110111010111", 
    12 => "1110101010100001", 13 => "1110011100101000", 14 => "1110001101101101", 
    15 => "1101111101101111", 16 => "1101101100101111", 17 => "1101011010101100", 
    18 => "1101000111100111", 19 => "1100110011100000", 20 => "1100011110010110", 
    21 => "1100001000001010", 22 => "1011110000111101", 23 => "1011011000101101", 
    24 => "1010111111011100", 25 => "1010100101001000", 26 => "1010001001110100", 
    27 => "1001101101011101", 28 => "1001010000000110", 29 => "1000110001101101", 
    30 => "1000010010010011", 31 => "0111110001110111", 32 => "0111010000011011", 
    33 => "0110101101111111", 34 => "0110001010100001", 35 => "0101100110000011", 
    36 => "0101000000100101", 37 => "0100011010000111", 38 => "0011110010101001", 
    39 => "0011001010001011", 40 => "0010100000101101", 41 => "0001110110010000", 
    42 => "0001001010110011", 43 => "0000011110010111", 44 => "1111110000111100", 
    45 => "1111000010100011", 46 => "1110010011001011", 47 => "1101100010110100", 
    48 => "1100110001011111", 49 => "1011111111001101", 50 => "1011001011111100", 
    51 => "1010010111101110", 52 => "1001100010100011", 53 => "1000101100011010", 
    54 => "0111110101010100", 55 => "0110111101010010", 56 => "0110000100010011", 
    57 => "0101001010011000", 58 => "0100001111100001", 59 => "0011010011101111", 
    60 => "0010010111000000", 61 => "0001011001010111", 62 => "0000011010110010", 
    63 => "1111011011010011", 64 => "1110011010111001", 65 => "1101011001100101", 
    66 => "1100010111010111", 67 => "1011010100001111", 68 => "1010010000001110", 
    69 => "1001001011010100", 70 => "1000000101100000", 71 => "0110111110110101", 
    72 => "0101110111010000", 73 => "0100101110110100", 74 => "0011100101100001", 
    75 => "0010011011010101", 76 => "0001010000010011", 77 => "0000000100011010", 
    78 => "1110110111101010", 79 => "1101101010000101", 80 => "1100011011101001", 
    81 => "1011001100011000", 82 => "1001111100010010", 83 => "1000101011010110", 
    84 => "0111011001100110", 85 => "0110000111000011", 86 => "0100110011101011", 
    87 => "0011011111011111", 88 => "0010001010100001", 89 => "0000110100101111", 
    90 => "1111011110001011", 91 => "1110000110110101", 92 => "1100101110101101", 
    93 => "1011010101110100", 94 => "1001111100001010", 95 => "1000100001101111", 
    96 => "0111000110100011", 97 => "0101101010101000", 98 => "0100001101111101", 
    99 => "0010110000100011", 100 => "0001010010011010", 101 => "1111110011100011", 
    102 => "1110010011111110", 103 => "1100110011101011", 104 => "1011010010101011", 
    105 => "1001110000111110", 106 => "1000001110100100", 107 => "0110101011011111", 
    108 => "0101000111101101", 109 => "0011100011010001", 110 => "0001111110001010", 
    111 => "0000011000011000", 112 => "1110110001111100", 113 => "1101001010110111", 
    114 => "1011100011001001", 115 => "1001111010110010", 116 => "1000010001110010", 
    117 => "0110101000001011", 118 => "0100111101111100", 119 => "0011010011000110", 
    120 => "0001100111101010", 121 => "1111111011100111", 122 => "1110001110111111", 
    123 => "1100100001110010", 124 => "1010110100000000", 125 => "1001000101101001", 
    126 => "0111010110101111", 127 => "0101100111010001", 128 => "0011110111010000", 
    129 => "0010000110101100", 130 => "0000010101100111", 131 => "1110100100000000", 
    132 => "1100110001111000", 133 => "1010111111001111", 134 => "1001001100000110", 
    135 => "0111011000011101", 136 => "0101100100010101", 137 => "0011101111101110", 
    138 => "0001111010101001", 139 => "0000000101000110", 140 => "1110001111000101", 
    141 => "1100011000101000", 142 => "1010100001101110", 143 => "1000101010011001", 
    144 => "0110110010101000", 145 => "0100111010011100", 146 => "0011000001110110", 
    147 => "0001001000110110", 148 => "1111001111011100", 149 => "1101010101101001", 
    150 => "1011011011011110", 151 => "1001100000111100", 152 => "0111100110000001", 
    153 => "0101101010110000", 154 => "0011101111001000", 155 => "0001110011001010", 
    156 => "1111110110110111", 157 => "1101111010001111", 158 => "1011111101010011", 
    159 => "1010000000000011", 160 => "1000000010011111", 161 => "0110000100101000", 
    162 => "0100000110011111", 163 => "0010001000000101", 164 => "0000001001011001", 
    165 => "1110001010011100", 166 => "1100001011001111", 167 => "1010001011110010", 
    168 => "1000001100000110", 169 => "0110001100001011", 170 => "0100001100000010", 
    171 => "0010001011101011", 172 => "0000001011000111", 173 => "1110001010010111", 
    174 => "1100001001011010", 175 => "1010001000010010", 176 => "1000000110111111", 
    177 => "0110000101100010", 178 => "0100000011111010", 179 => "0010000010001001", 
    180 => "0000000000001111", 181 => "1101111110001101", 182 => "1011111100000010", 
    183 => "1001111001110001", 184 => "0111110111011001", 185 => "0101110100111010", 
    186 => "0011110010010110", 187 => "0001101111101100", 188 => "1111101100111110", 
    189 => "1101101010001100", 190 => "1011100111010110", 191 => "1001100100011110", 
    192 => "0111100001100010", 193 => "0101011110100101", 194 => "0011011011100110", 
    195 => "0001011000100111", 196 => "1111010101100111", 197 => "1101010010100111", 
    198 => "1011001111101000", 199 => "1001001100101010", 200 => "0111001001101110", 
    201 => "0101000110110100", 202 => "0011000011111101", 203 => "0001000001001010", 
    204 => "1110111110011010", 205 => "1100111011101111", 206 => "1010111001001001", 
    207 => "1000110110101000", 208 => "0110110100001110", 209 => "0100110001111010", 
    210 => "0010101111101101", 211 => "0000101101101000", 212 => "1110101011101011", 
    213 => "1100101001110111", 214 => "1010101000001100", 215 => "1000100110101011", 
    216 => "0110100101010100", 217 => "0100100100001000", 218 => "0010100011000111", 
    219 => "0000100010010010", 220 => "1110100001101010", 221 => "1100100001001111", 
    222 => "1010100001000001", 223 => "1000100001000001", 224 => "0110100001001111", 
    225 => "0100100001101101", 226 => "0010100010011010", 227 => "0000100011011000", 
    228 => "1110100100100110", 229 => "1100100110000101", 230 => "1010100111110110", 
    231 => "1000101001111000", 232 => "0110101100001110", 233 => "0100101110110111", 
    234 => "0010110001110011", 235 => "0000110101000100", 236 => "1110111000101010", 
    237 => "1100111100100100", 238 => "1011000000110101", 239 => "1001000101011011", 
    240 => "0111001010011001", 241 => "0101001111101110", 242 => "0011010101011010", 
    243 => "0001011011011111", 244 => "1111100001111100", 245 => "1101101000110011", 
    246 => "1011110000000100", 247 => "1001110111101110", 248 => "0111111111110100", 
    249 => "0110001000010101", 250 => "0100010001010001", 251 => "0010011010101010", 
    252 => "0000100100011111", 253 => "1110101110110010", 254 => "1100111001100010", 
    255 => "1011000100110000", 256 => "1001010000011101", 257 => "0111011100101001", 
    258 => "0101101001010101", 259 => "0011110110100001", 260 => "0010000100001101", 
    261 => "0000010010011010", 262 => "1110100001001001", 263 => "1100110000011001", 
    264 => "1011000000001100", 265 => "1001010000100010", 266 => "0111100001011011", 
    267 => "0101110010111000", 268 => "0100000100111000", 269 => "0010010111011110", 
    270 => "0000101010101001", 271 => "1110111110011001", 272 => "1101010010101111", 
    273 => "1011100111101100", 274 => "1001111101001111", 275 => "1000010011011010", 
    276 => "0110101010001100", 277 => "0101000001100111", 278 => "0011011001101010", 
    279 => "0001110010010110", 280 => "0000001011101100", 281 => "1110100101101011", 
    282 => "1101000000010101", 283 => "1011011011101001", 284 => "1001110111101001", 
    285 => "1000010100010100", 286 => "0110110001101011", 287 => "0101001111101110", 
    288 => "0011101110011110", 289 => "0010001101111011", 290 => "0000101110000101", 
    291 => "1111001110111110", 292 => "1101110000100100", 293 => "1100010010111010", 
    294 => "1010110101111110", 295 => "1001011001110010", 296 => "0111111110010110", 
    297 => "0110100011101010", 298 => "0101001001101110", 299 => "0011110000100100", 
    300 => "0010011000001010", 301 => "0001000000100011", 302 => "1111101001101101", 
    303 => "1110010011101010", 304 => "1100111110011001", 305 => "1011101001111100", 
    306 => "1010010110010010", 307 => "1001000011011011", 308 => "0111110001011001", 
    309 => "0110100000001011", 310 => "0101001111110010", 311 => "0100000000001110", 
    312 => "0010110001100000", 313 => "0001100011100111", 314 => "0000010110100100", 
    315 => "1111001010011000", 316 => "1101111111000010", 317 => "1100110100100011", 
    318 => "1011101010111100", 319 => "1010100010001100", 320 => "1001011010010100", 
    321 => "1000010011010101", 322 => "0111001101001101", 323 => "0110000111111111", 
    324 => "0101000011101010", 325 => "0100000000001101", 326 => "0010111101101011", 
    327 => "0001111100000010", 328 => "0000111011010100", 329 => "1111111011100000", 
    330 => "1110111100100111", 331 => "1101111110101000", 332 => "1101000001100101", 
    333 => "1100000101011101", 334 => "1011001010010001", 335 => "1010010000000001", 
    336 => "1001010110101101", 337 => "1000011110010101", 338 => "0111100110111010", 
    339 => "0110110000011100", 340 => "0101111010111011", 341 => "0101000110010111", 
    342 => "0100010010110001", 343 => "0011100000001000", 344 => "0010101110011110", 
    345 => "0001111101110001", 346 => "0001001110000011", 347 => "0000011111010011", 
    348 => "1111110001100010", 349 => "1111000100110000", 350 => "1110011000111101", 
    351 => "1101101110001010", 352 => "1101000100010110", 353 => "1100011011100001", 
    354 => "1011110011101100", 355 => "1011001100110111", 356 => "1010100111000010", 
    357 => "1010000010001110", 358 => "1001011110011010", 359 => "1000111011100110", 
    360 => "1000011001110011", 361 => "0111111001000001", 362 => "0111011001010000", 
    363 => "0110111010100000", 364 => "0110011100110010", 365 => "0110000000000100", 
    366 => "0101100100011000", 367 => "0101001001101110", 368 => "0100110000000101", 
    369 => "0100010111011110", 370 => "0011111111111001", 371 => "0011101001010110", 
    372 => "0011010011110101", 373 => "0010111111010111", 374 => "0010101011111010", 
    375 => "0010011001100000", 376 => "0010001000001000", 377 => "0001110111110011", 
    378 => "0001101000100000", 379 => "0001011010010000", 380 => "0001001101000010", 
    381 => "0001000000111000", 382 => "0000110101110000", 383 => "0000101011101011", 
    384 => "0000100010101000", 385 => "0000011010101001", 386 => "0000010011101100", 
    387 => "0000001101110011", 388 => "0000001000111100", 389 => "0000000101001001", 
    390 => "0000000010011000", 391 => "0000000000101011", 392 => "0000000000000000", 
    393 => "0000000000011001", 394 => "0000000001110100", 395 => "0000000100010011", 
    396 => "0000000111110100", 397 => "0000001100011001", 398 => "0000010010000001", 
    399 => "0000011000101011", 400 => "0000100000011001", 401 => "0000101001001001", 
    402 => "0000110010111100", 403 => "0000111101110010", 404 => "0001001001101011", 
    405 => "0001010110100111", 406 => "0001100100100101", 407 => "0001110011100110", 
    408 => "0010000011101010", 409 => "0010010100110000", 410 => "0010100110111000", 
    411 => "0010111010000011", 412 => "0011001110010000", 413 => "0011100011011111", 
    414 => "0011111001110000", 415 => "0100010001000100", 416 => "0100101001011001", 
    417 => "0101000010110000", 418 => "0101011101001001", 419 => "0101111000100011", 
    420 => "0110010100111111", 421 => "0110110010011100", 422 => "0111010000111011", 
    423 => "0111110000011010", 424 => "1000010000111011", 425 => "1000110010011101", 
    426 => "1001010100111111", 427 => "1001111000100010", 428 => "1010011101000101", 
    429 => "1011000010101001", 430 => "1011101001001100", 431 => "1100010000110000", 
    432 => "1100111001010100", 433 => "1101100010110111", 434 => "1110001101011010", 
    435 => "1110111000111100", 436 => "1111100101011101", 437 => "0000010010111101", 
    438 => "0001000001011100", 439 => "0001110000111001", 440 => "0010100001010101", 
    441 => "0011010010101111", 442 => "0100000101000111", 443 => "0100111000011101", 
    444 => "0101101100110000", 445 => "0110100010000001", 446 => "0111011000001111", 
    447 => "1000001111011001", 448 => "1001000111100001", 449 => "1010000000100101", 
    450 => "1010111010100101", 451 => "1011110101100001", 452 => "1100110001011001", 
    453 => "1101101110001100", 454 => "1110101011111011", 455 => "1111101010100100", 
    456 => "0000101010001001", 457 => "0001101010100111", 458 => "0010101100000000", 
    459 => "0011101110010011", 460 => "0100110001100000", 461 => "0101110101100110", 
    462 => "0110111010100101", 463 => "1000000000011101", 464 => "1001000111001110", 
    465 => "1010001110110111", 466 => "1011010111011000", 467 => "1100100000110000", 
    468 => "1101101011000000", 469 => "1110110110000111", 470 => "0000000010000101", 
    471 => "0001001110111001", 472 => "0010011100100011", 473 => "0011101011000100", 
    474 => "0100111010011001", 475 => "0110001010100100", 476 => "0111011011100100", 
    477 => "1000101101011000", 478 => "1010000000000000", 479 => "1011010011011101", 
    480 => "1100100111101101", 481 => "1101111100101111", 482 => "1111010010100101", 
    483 => "0000101001001101", 484 => "0010000000101000", 485 => "0011011000110100", 
    486 => "0100110001110001", 487 => "0110001011100000", 488 => "0111100101111111", 
    489 => "1001000001001110", 490 => "1010011101001110", 491 => "1011111001111100", 
    492 => "1101010111011010", 493 => "1110110101100111", 494 => "0000010100100011", 
    495 => "0001110100001100", 496 => "0011010100100011", 497 => "0100110101100111", 
    498 => "0110010111010111", 499 => "0111111001110101", 500 => "1001011100111110", 
    501 => "1011000000110011", 502 => "1100100101010011", 503 => "1110001010011110", 
    504 => "1111110000010011", 505 => "0001010110110010", 506 => "0010111101111011", 
    507 => "0100100101101101", 508 => "0110001110001000", 509 => "0111110111001010", 
    510 => "1001100000110101", 511 => "1011001011000111", 512 => "1100110110000000", 
    513 => "1110100001100000", 514 => "0000001101100110", 515 => "0001111010010001", 
    516 => "0011100111100010", 517 => "0101010101010111", 518 => "0111000011110000", 
    519 => "1000110010101110", 520 => "1010100010001111", 521 => "1100010010010011", 
    522 => "1110000010111001", 523 => "1111110100000001", 524 => "0001100101101011", 
    525 => "0011010111110110", 526 => "0101001010100010", 527 => "0110111101101110", 
    528 => "1000110001011001", 529 => "1010100101100100", 530 => "1100011010001110", 
    531 => "1110001111010101", 532 => "0000000100111011", 533 => "0001111010111110", 
    534 => "0011110001011101", 535 => "0101101000011001", 536 => "0111011111110001", 
    537 => "1001010111100100", 538 => "1011001111110011", 539 => "1101001000011011", 
    540 => "1111000001011101", 541 => "0000111010111001", 542 => "0010110100101110", 
    543 => "0100101110111011", 544 => "0110101001100000", 545 => "1000100100011100", 
    546 => "1010011111101111", 547 => "1100011011011001", 548 => "1110010111011001", 
    549 => "0000010011101110", 550 => "0010010000010111", 551 => "0100001101010101", 
    552 => "0110001010100111", 553 => "1000001000001101", 554 => "1010000110000101", 
    555 => "1100000100001111", 556 => "1110000010101100", 557 => "0000000001011001", 
    558 => "0010000000010111", 559 => "0011111111100110", 560 => "0101111111000100", 
    561 => "0111111110110001", 562 => "1001111110101101", 563 => "1011111110111000", 
    564 => "1101111111001111", 565 => "1111111111110100", 566 => "0010000000100110", 
    567 => "0100000001100011", 568 => "0110000010101100", 569 => "1000000100000000", 
    570 => "1010000101011111", 571 => "1100000111000111", 572 => "1110001000111001", 
    573 => "0000001010110100", 574 => "0010001100110111", 575 => "0100001111000010", 
    576 => "0110010001010100", 577 => "1000010011101101", 578 => "1010010110001100", 
    579 => "1100011000110000", 580 => "1110011011011010", 581 => "0000011110001001", 
    582 => "0010100000111011", 583 => "0100100011110001", 584 => "0110100110101010", 
    585 => "1000101001100110", 586 => "1010101100100011", 587 => "1100101111100010", 
    588 => "1110110010100010", 589 => "0000110101100010", 590 => "0010111000100001", 
    591 => "0100111011100000", 592 => "0110111110011110", 593 => "1001000001011010", 
    594 => "1011000100010011", 595 => "1101000111001010", 596 => "1111001001111101", 
    597 => "0001001100101100", 598 => "0011001111010111", 599 => "0101010001111101", 
    600 => "0111010100011101", 601 => "1001010110110111", 602 => "1011011001001010", 
    603 => "1101011011010110", 604 => "1111011101011011", 605 => "0001011111010111", 
    606 => "0011100001001011", 607 => "0101100010110101", 608 => "0111100100010101", 
    609 => "1001100101101011", 610 => "1011100110110110", 611 => "1101100111110110", 
    612 => "1111101000101010", 613 => "0001101001010001", 614 => "0011101001101011", 
    615 => "0101101001111000", 616 => "0111101001110111", 617 => "1001101001100111", 
    618 => "1011101001001000", 619 => "1101101000011001", 620 => "1111100111011010", 
    621 => "0001100110001011", 622 => "0011100100101010", 623 => "0101100010111000", 
    624 => "0111100000110100", 625 => "1001011110011100", 626 => "1011011011110010", 
    627 => "1101011000110100", 628 => "1111010101100001", 629 => "0001010001111010", 
    630 => "0011001101111101", 631 => "0101001001101011", 632 => "0111000101000011", 
    633 => "1001000000000011", 634 => "1010111010101100", 635 => "1100110100111110", 
    636 => "1110101110110111", 637 => "0000101000010111", 638 => "0010100001011110", 
    639 => "0100011010001100", 640 => "0110010010011111", 641 => "1000001010010111", 
    642 => "1010000001110100", 643 => "1011111000110101", 644 => "1101101111011010", 
    645 => "1111100101100010", 646 => "0001011011001101", 647 => "0011010000011010", 
    648 => "0101000101001001", 649 => "0110111001011001", 650 => "1000101101001011", 
    651 => "1010100000011100", 652 => "1100010011001110", 653 => "1110000101011111", 
    654 => "1111110111001111", 655 => "0001101000011110", 656 => "0011011001001010", 
    657 => "0101001001010100", 658 => "0110111000111100", 659 => "1000101000000000", 
    660 => "1010010110100000", 661 => "1100000100011100", 662 => "1101110001110011", 
    663 => "1111011110100101", 664 => "0001001010110010", 665 => "0010110110011000", 
    666 => "0100100001011001", 667 => "0110001011110010", 668 => "0111110101100100", 
    669 => "1001011110101110", 670 => "1011000111010000", 671 => "1100101111001001", 
    672 => "1110010110011010", 673 => "1111111101000000", 674 => "0001100010111101", 
    675 => "0011001000010000", 676 => "0100101100111000", 677 => "0110010000110101", 
    678 => "0111110100000110", 679 => "1001010110101011", 680 => "1010111000100100", 
    681 => "1100011001110001", 682 => "1101111010010000", 683 => "1111011010000001", 
    684 => "0000111001000101", 685 => "0010010111011010", 686 => "0011110101000001", 
    687 => "0101010001111000", 688 => "0110101110000001", 689 => "1000001001011001", 
    690 => "1001100100000001", 691 => "1010111101111000", 692 => "1100010110111111", 
    693 => "1101101111010100", 694 => "1111000110110111", 695 => "0000011101101001", 
    696 => "0001110011100111", 697 => "0011001000110100", 698 => "0100011101001101", 
    699 => "0101110000110011", 700 => "0111000011100101", 701 => "1000010101100010", 
    702 => "1001100110101100", 703 => "1010110111000000", 704 => "1100000110100000", 
    705 => "1101010101001010", 706 => "1110100010111110", 707 => "1111101111111100", 
    708 => "0000111100000100", 709 => "0010000111010101", 710 => "0011010001101111", 
    711 => "0100011011010001", 712 => "0101100011111100", 713 => "0110101011101111", 
    714 => "0111110010101010", 715 => "1000111000101101", 716 => "1001111101110110", 
    717 => "1011000010000111", 718 => "1100000101011110", 719 => "1101000111111100", 
    720 => "1110001001011111", 721 => "1111001010001001", 722 => "0000001001111000", 
    723 => "0001001000101100", 724 => "0010000110100110", 725 => "0011000011100100", 
    726 => "0011111111100110", 727 => "0100111010101101", 728 => "0101110100111001", 
    729 => "0110101110000111", 730 => "0111100110011010", 731 => "1000011101110000", 
    732 => "1001010100001001", 733 => "1010001001100101", 734 => "1010111110000011", 
    735 => "1011110001100100", 736 => "1100100100001000", 737 => "1101010101101101", 
    738 => "1110000110010100", 739 => "1110110101111101", 740 => "1111100100100111", 
    741 => "0000010010010011", 742 => "0000111111000000", 743 => "0001101010101101", 
    744 => "0010010101011011", 745 => "0010111111001010", 746 => "0011100111111001", 
    747 => "0100001111101001", 748 => "0100110110011000", 749 => "0101011100001000", 
    750 => "0110000000110111", 751 => "0110100100100101", 752 => "0111000111010011", 
    753 => "0111101001000001", 754 => "1000001001101101", 755 => "1000101001011001", 
    756 => "1001001000000011", 757 => "1001100101101100", 758 => "1010000010010100", 
    759 => "1010011101111011", 760 => "1010111000011111", 761 => "1011010010000010", 
    762 => "1011101010100100", 763 => "1100000010000011", 764 => "1100011000100000", 
    765 => "1100101101111100", 766 => "1101000010010101", 767 => "1101010101101100", 
    768 => "1101101000000000", 769 => "1101111001010010", 770 => "1110001001100010", 
    771 => "1110011000101111", 772 => "1110100110111010", 773 => "1110110100000001", 
    774 => "1111000000000110", 775 => "1111001011001001", 776 => "1111010101001000", 
    777 => "1111011110000101", 778 => "1111100101111111", 779 => "1111101100110101", 
    780 => "1111110010101001", 781 => "1111110111011010", 782 => "1111111011001000", 
    783 => "1111111101110011", 784 => "1111111111011011", 785 => "0000000000000000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "block_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "block";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity get_trig_vals_cos_tables_low_V_12 is
    generic (
        DataWidth : INTEGER := 16;
        AddressRange : INTEGER := 786;
        AddressWidth : INTEGER := 10);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of get_trig_vals_cos_tables_low_V_12 is
    component get_trig_vals_cos_tables_low_V_12_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    get_trig_vals_cos_tables_low_V_12_rom_U :  component get_trig_vals_cos_tables_low_V_12_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


