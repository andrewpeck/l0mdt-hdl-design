-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity get_trig_vals_sin_tables_low_V_3_rom is 
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


architecture rtl of get_trig_vals_sin_tables_low_V_3_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0000011100100111", 1 => "0010011111100111", 2 => "0100100010100111", 
    3 => "0110100101100101", 4 => "1000101000100001", 5 => "1010101011011011", 
    6 => "1100101110010010", 7 => "1110110001000110", 8 => "0000110011110110", 
    9 => "0010110110100010", 10 => "0100111001001000", 11 => "0110111011101001", 
    12 => "1000111110000101", 13 => "1011000000011001", 14 => "1101000010100111", 
    15 => "1111000100101101", 16 => "0001000110101011", 17 => "0011001000100000", 
    18 => "0101001010001100", 19 => "0111001011101110", 20 => "1001001101000110", 
    21 => "1011001110010011", 22 => "1101001111010101", 23 => "1111010000001011", 
    24 => "0001010000110101", 25 => "0011010001010010", 26 => "0101010001100001", 
    27 => "0111010001100010", 28 => "1001010001010101", 29 => "1011010000111001", 
    30 => "1101010000001110", 31 => "1111001111010010", 32 => "0001001110000110", 
    33 => "0011001100101001", 34 => "0101001010111010", 35 => "0111001000111001", 
    36 => "1001000110100101", 37 => "1011000011111110", 38 => "1101000001000100", 
    39 => "1110111101110101", 40 => "0000111010010010", 41 => "0010110110011010", 
    42 => "0100110010001011", 43 => "0110101101100111", 44 => "1000101000101100", 
    45 => "1010100011011010", 46 => "1100011101110000", 47 => "1110010111101110", 
    48 => "0000010001010011", 49 => "0010001010011111", 50 => "0100000011010001", 
    51 => "0101111011101001", 52 => "0111110011100110", 53 => "1001101011001000", 
    54 => "1011100010001111", 55 => "1101011000111001", 56 => "1111001111000111", 
    57 => "0001000100110111", 58 => "0010111010001010", 59 => "0100101110111111", 
    60 => "0110100011010101", 61 => "1000010111001100", 62 => "1010001010100100", 
    63 => "1011111101011100", 64 => "1101101111110011", 65 => "1111100001101001", 
    66 => "0001010010111110", 67 => "0011000011110001", 68 => "0100110100000010", 
    69 => "0110100011110000", 70 => "1000010010111011", 71 => "1010000001100010", 
    72 => "1011101111100101", 73 => "1101011101000011", 74 => "1111001001111100", 
    75 => "0000110110010000", 76 => "0010100001111110", 77 => "0100001101000110", 
    78 => "0101110111100110", 79 => "0111100001100000", 80 => "1001001010110001", 
    81 => "1010110011011011", 82 => "1100011011011100", 83 => "1110000010110100", 
    84 => "1111101001100011", 85 => "0001001111101000", 86 => "0010110101000011", 
    87 => "0100011001110011", 88 => "0101111101111000", 89 => "0111100001010010", 
    90 => "1001000011111111", 91 => "1010100110000001", 92 => "1100000111010110", 
    93 => "1101100111111101", 94 => "1111000111111000", 95 => "0000100111000100", 
    96 => "0010000101100010", 97 => "0011100011010010", 98 => "0101000000010010", 
    99 => "0110011100100011", 100 => "0111111000000101", 101 => "1001010010110110", 
    102 => "1010101100110110", 103 => "1100000110000110", 104 => "1101011110100101", 
    105 => "1110110110010010", 106 => "0000001101001101", 107 => "0001100011010101", 
    108 => "0010111000101011", 109 => "0100001101001110", 110 => "0101100000111101", 
    111 => "0110110011111001", 112 => "1000000110000001", 113 => "1001010111010100", 
    114 => "1010100111110011", 115 => "1011110111011100", 116 => "1101000110010001", 
    117 => "1110010100001111", 118 => "1111100001011000", 119 => "0000101101101010", 
    120 => "0001111001000101", 121 => "0011000011101010", 122 => "0100001101010111", 
    123 => "0101010110001100", 124 => "0110011110001010", 125 => "0111100101010000", 
    126 => "1000101011011101", 127 => "1001110000110001", 128 => "1010110101001101", 
    129 => "1011111000101111", 130 => "1100111011010111", 131 => "1101111101000110", 
    132 => "1110111101111011", 133 => "1111111101110101", 134 => "0000111100110100", 
    135 => "0001111010111001", 136 => "0010111000000010", 137 => "0011110100010000", 
    138 => "0100101111100011", 139 => "0101101001111001", 140 => "0110100011010100", 
    141 => "0111011011110010", 142 => "1000010011010011", 143 => "1001001001111000", 
    144 => "1001111111011111", 145 => "1010110100001001", 146 => "1011100111110110", 
    147 => "1100011010100101", 148 => "1101001100010110", 149 => "1101111101001001", 
    150 => "1110101100111110", 151 => "1111011011110100", 152 => "0000001001101100", 
    153 => "0000110110100100", 154 => "0001100010011110", 155 => "0010001101011000", 
    156 => "0010110111010011", 157 => "0011100000001111", 158 => "0100001000001010", 
    159 => "0100101111000110", 160 => "0101010101000001", 161 => "0101111001111101", 
    162 => "0110011101110111", 163 => "0111000000110010", 164 => "0111100010101011", 
    165 => "1000000011100100", 166 => "1000100011011100", 167 => "1001000010010011", 
    168 => "1001100000001001", 169 => "1001111100111101", 170 => "1010011000110000", 
    171 => "1010110011100001", 172 => "1011001101010001", 173 => "1011100101111110", 
    174 => "1011111101101010", 175 => "1100010100010100", 176 => "1100101001111100", 
    177 => "1100111110100010", 178 => "1101010010000101", 179 => "1101100100100110", 
    180 => "1101110110000101", 181 => "1110000110100001", 182 => "1110010101111011", 
    183 => "1110100100010010", 184 => "1110110001100111", 185 => "1110111101111001", 
    186 => "1111001001001000", 187 => "1111010011010100", 188 => "1111011100011101", 
    189 => "1111100100100100", 190 => "1111101011100111", 191 => "1111110001101000", 
    192 => "1111110110100101", 193 => "1111111010100000", 194 => "1111111101010111", 
    195 => "1111111111001100", 196 => "1111111111111110", 197 => "1111111111101100", 
    198 => "1111111110011000", 199 => "1111111100000000", 200 => "1111111000100101", 
    201 => "1111110100001000", 202 => "1111101110100111", 203 => "1111101000000100", 
    204 => "1111100000011101", 205 => "1111010111110100", 206 => "1111001110001000", 
    207 => "1111000011011001", 208 => "1110110111100111", 209 => "1110101010110010", 
    210 => "1110011100111011", 211 => "1110001110000001", 212 => "1101111110000100", 
    213 => "1101101101000101", 214 => "1101011011000100", 215 => "1101001000000000", 
    216 => "1100110011111010", 217 => "1100011110110010", 218 => "1100001000100111", 
    219 => "1011110001011011", 220 => "1011011001001101", 221 => "1010111111111101", 
    222 => "1010100101101011", 223 => "1010001010010111", 224 => "1001101110000010", 
    225 => "1001010000101100", 226 => "1000110010010100", 227 => "1000010010111011", 
    228 => "0111110010100001", 229 => "0111010001000111", 230 => "0110101110101011", 
    231 => "0110001011001111", 232 => "0101100110110011", 233 => "0101000001010110", 
    234 => "0100011010111001", 235 => "0011110011011100", 236 => "0011001010111111", 
    237 => "0010100001100010", 238 => "0001110111000110", 239 => "0001001011101011", 
    240 => "0000011111010001", 241 => "1111110001110111", 242 => "1111000011011111", 
    243 => "1110010100001000", 244 => "1101100011110011", 245 => "1100110010011111", 
    246 => "1100000000001110", 247 => "1011001100111110", 248 => "1010011000110001", 
    249 => "1001100011100111", 250 => "1000101101100000", 251 => "0111110110011011", 
    252 => "0110111110011010", 253 => "0110000101011101", 254 => "0101001011100011", 
    255 => "0100010000101101", 256 => "0011010100111100", 257 => "0010011000001111", 
    258 => "0001011010100110", 259 => "0000011100000011", 260 => "1111011100100101", 
    261 => "1110011100001100", 262 => "1101011010111001", 263 => "1100011000101100", 
    264 => "1011010101100101", 265 => "1010010001100101", 266 => "1001001100101100", 
    267 => "1000000110111010", 268 => "0111000000001111", 269 => "0101111000101100", 
    270 => "0100110000010001", 271 => "0011100110111111", 272 => "0010011100110101", 
    273 => "0001010001110011", 274 => "0000000101111011", 275 => "1110111001001101", 
    276 => "1101101011101000", 277 => "1100011101001110", 278 => "1011001101111110", 
    279 => "1001111101111000", 280 => "1000101100111110", 281 => "0111011011001111", 
    282 => "0110001000101100", 283 => "0100110101010110", 284 => "0011100001001011", 
    285 => "0010001100001110", 286 => "0000110110011101", 287 => "1111011111111010", 
    288 => "1110001000100101", 289 => "1100110000011110", 290 => "1011010111100110", 
    291 => "1001111101111101", 292 => "1000100011100011", 293 => "0111001000011000", 
    294 => "0101101100011110", 295 => "0100001111110100", 296 => "0010110010011011", 
    297 => "0001010100010011", 298 => "1111110101011101", 299 => "1110010101111000", 
    300 => "1100110101100110", 301 => "1011010100100111", 302 => "1001110010111011", 
    303 => "1000010000100010", 304 => "0110101101011110", 305 => "0101001001101101", 
    306 => "0011100101010010", 307 => "0010000000001011", 308 => "0000011010011010", 
    309 => "1110110100000000", 310 => "1101001100111011", 311 => "1011100101001110", 
    312 => "1001111100110111", 313 => "1000010011111001", 314 => "0110101010010010", 
    315 => "0101000000000100", 316 => "0011010101001111", 317 => "0001101001110100", 
    318 => "1111111101110010", 319 => "1110010001001010", 320 => "1100100011111110", 
    321 => "1010110110001100", 322 => "1001000111110110", 323 => "0111011000111101", 
    324 => "0101101001011111", 325 => "0011111001011111", 326 => "0010001000111101", 
    327 => "0000010111111000", 328 => "1110100110010001", 329 => "1100110100001010", 
    330 => "1011000001100010", 331 => "1001001110011001", 332 => "0111011010110001", 
    333 => "0101100110101001", 334 => "0011110010000011", 335 => "0001111100111110", 
    336 => "0000000111011100", 337 => "1110010001011100", 338 => "1100011011000000", 
    339 => "1010100100000111", 340 => "1000101100110010", 341 => "0110110101000001", 
    342 => "0100111100110110", 343 => "0011000100010000", 344 => "0001001011010000", 
    345 => "1111010001110111", 346 => "1101011000000101", 347 => "1011011101111011", 
    348 => "1001100011011000", 349 => "0111101000011110", 350 => "0101101101001101", 
    351 => "0011110001100110", 352 => "0001110101101001", 353 => "1111111001010110", 
    354 => "1101111100101111", 355 => "1011111111110011", 356 => "1010000010100011", 
    357 => "1000000100111111", 358 => "0110000111001001", 359 => "0100001001000001", 
    360 => "0010001010100110", 361 => "0000001011111011", 362 => "1110001100111110", 
    363 => "1100001101110001", 364 => "1010001110010101", 365 => "1000001110101001", 
    366 => "0110001110101110", 367 => "0100001110100110", 368 => "0010001110001111", 
    369 => "0000001101101100", 370 => "1110001100111011", 371 => "1100001011111111", 
    372 => "1010001010110111", 373 => "1000001001100100", 374 => "0110001000000111", 
    375 => "0100000110100000", 376 => "0010000100101111", 377 => "0000000010110101", 
    378 => "1110000000110011", 379 => "1011111110101001", 380 => "1001111100010111", 
    381 => "0111111001111111", 382 => "0101110111100001", 383 => "0011110100111101", 
    384 => "0001110010010011", 385 => "1111101111100101", 386 => "1101101100110011", 
    387 => "1011101001111110", 388 => "1001100111000101", 389 => "0111100100001010", 
    390 => "0101100001001100", 391 => "0011011110001110", 392 => "0001011011001110", 
    393 => "1111011000001110", 394 => "1101010101001110", 395 => "1011010010001111", 
    396 => "1001001111010001", 397 => "0111001100010101", 398 => "0101001001011011", 
    399 => "0011000110100101", 400 => "0001000011110001", 401 => "1111000001000001", 
    402 => "1100111110010110", 403 => "1010111011110000", 404 => "1000111001001111", 
    405 => "0110110110110100", 406 => "0100110100100000", 407 => "0010110010010011", 
    408 => "0000110000001110", 409 => "1110101110010001", 410 => "1100101100011101", 
    411 => "1010101010110001", 412 => "1000101001010000", 413 => "0110100111111001", 
    414 => "0100100110101101", 415 => "0010100101101100", 416 => "0000100100110111", 
    417 => "1110100100001110", 418 => "1100100011110010", 419 => "1010100011100100", 
    420 => "1000100011100100", 421 => "0110100011110010", 422 => "0100100100010000", 
    423 => "0010100100111101", 424 => "0000100101111010", 425 => "1110100111000111", 
    426 => "1100101000100110", 427 => "1010101010010111", 428 => "1000101100011001", 
    429 => "0110101110101110", 430 => "0100110001010111", 431 => "0010110100010011", 
    432 => "0000110111100011", 433 => "1110111011001000", 434 => "1100111111000010", 
    435 => "1011000011010011", 436 => "1001000111111001", 437 => "0111001100110110", 
    438 => "0101010010001010", 439 => "0011010111110110", 440 => "0001011101111010", 
    441 => "1111100100010111", 442 => "1101101011001110", 443 => "1011110010011110", 
    444 => "1001111010001000", 445 => "1000000010001101", 446 => "0110001010101101", 
    447 => "0100010011101001", 448 => "0010011101000001", 449 => "0000100110110110", 
    450 => "1110110001001000", 451 => "1100111011110111", 452 => "1011000111000101", 
    453 => "1001010010110010", 454 => "0111011110111101", 455 => "0101101011101000", 
    456 => "0011111000110011", 457 => "0010000110011111", 458 => "0000010100101011", 
    459 => "1110100011011001", 460 => "1100110010101001", 461 => "1011000010011011", 
    462 => "1001010010110000", 463 => "0111100011101000", 464 => "0101110101000100", 
    465 => "0100000111000101", 466 => "0010011001101001", 467 => "0000101100110011", 
    468 => "1111000000100011", 469 => "1101010100111000", 470 => "1011101001110100", 
    471 => "1001111111010111", 472 => "1000010101100000", 473 => "0110101100010010", 
    474 => "0101000011101100", 475 => "0011011011101110", 476 => "0001110100011010", 
    477 => "0000001101101110", 478 => "1110100111101101", 479 => "1101000010010110", 
    480 => "1011011101101001", 481 => "1001111001101000", 482 => "1000010110010010", 
    483 => "0110110011101000", 484 => "0101010001101010", 485 => "0011110000011010", 
    486 => "0010001111110110", 487 => "0000101111111111", 488 => "1111010000110111", 
    489 => "1101110010011101", 490 => "1100010100110001", 491 => "1010110111110101", 
    492 => "1001011011101000", 493 => "1000000000001010", 494 => "0110100101011101", 
    495 => "0101001011100001", 496 => "0011110010010101", 497 => "0010011001111011", 
    498 => "0001000010010010", 499 => "1111101011011011", 500 => "1110010101010111", 
    501 => "1101000000000110", 502 => "1011101011100111", 503 => "1010010111111100", 
    504 => "1001000101000101", 505 => "0111110011000001", 506 => "0110100001110010", 
    507 => "0101010001011000", 508 => "0100000001110011", 509 => "0010110011000100", 
    510 => "0001100101001010", 511 => "0000011000000110", 512 => "1111001011111001", 
    513 => "1110000000100010", 514 => "1100110110000010", 515 => "1011101100011001", 
    516 => "1010100011101001", 517 => "1001011011110000", 518 => "1000010100101111", 
    519 => "0111001110100110", 520 => "0110001001010111", 521 => "0101000101000000", 
    522 => "0100000001100011", 523 => "0010111110111111", 524 => "0001111101010110", 
    525 => "0000111100100110", 526 => "1111111100110001", 527 => "1110111101110110", 
    528 => "1101111111110111", 529 => "1101000010110010", 530 => "1100000110101001", 
    531 => "1011001011011100", 532 => "1010010001001011", 533 => "1001010111110101", 
    534 => "1000011111011101", 535 => "0111101000000000", 536 => "0110110001100001", 
    537 => "0101111011111111", 538 => "0101000111011010", 539 => "0100010011110010", 
    540 => "0011100001001000", 541 => "0010101111011101", 542 => "0001111110101111", 
    543 => "0001001110111111", 544 => "0000100000001110", 545 => "1111110010011100", 
    546 => "1111000101101001", 547 => "1110011001110101", 548 => "1101101111000000", 
    549 => "1101000101001010", 550 => "1100011100010100", 551 => "1011110100011110", 
    552 => "1011001101101000", 553 => "1010100111110010", 554 => "1010000010111100", 
    555 => "1001011111000111", 556 => "1000111100010010", 557 => "1000011010011110", 
    558 => "0111111001101011", 559 => "0111011001111000", 560 => "0110111011000111", 
    561 => "0110011101010111", 562 => "0110000000101000", 563 => "0101100100111011", 
    564 => "0101001010001111", 565 => "0100110000100101", 566 => "0100010111111101", 
    567 => "0100000000010111", 568 => "0011101001110010", 569 => "0011010100010000", 
    570 => "0010111111110000", 571 => "0010101100010010", 572 => "0010011001110111", 
    573 => "0010001000011110", 574 => "0001111000000111", 575 => "0001101000110011", 
    576 => "0001011010100010", 577 => "0001001101010011", 578 => "0001000001000111", 
    579 => "0000110101111101", 580 => "0000101011110111", 581 => "0000100010110011", 
    582 => "0000011010110010", 583 => "0000010011110101", 584 => "0000001101111010", 
    585 => "0000001001000010", 586 => "0000000101001101", 587 => "0000000010011011", 
    588 => "0000000000101100", 589 => "0000000000000000", 590 => "0000000000010111", 
    591 => "0000000001110010", 592 => "0000000100001111", 593 => "0000000111101111", 
    594 => "0000001100010011", 595 => "0000010001111001", 596 => "0000011000100010", 
    597 => "0000100000001110", 598 => "0000101000111101", 599 => "0000110010101111", 
    600 => "0000111101100100", 601 => "0001001001011100", 602 => "0001010110010110", 
    603 => "0001100100010011", 604 => "0001110011010010", 605 => "0010000011010101", 
    606 => "0010010100011001", 607 => "0010100110100000", 608 => "0010111001101010", 
    609 => "0011001101110101", 610 => "0011100011000011", 611 => "0011111001010011", 
    612 => "0100010000100101", 613 => "0100101000111001", 614 => "0101000010001111", 
    615 => "0101011100100110", 616 => "0101111000000000", 617 => "0110010100011010", 
    618 => "0110110001110110", 619 => "0111010000010011", 620 => "0111101111110010", 
    621 => "1000010000010001", 622 => "1000110001110001", 623 => "1001010100010010", 
    624 => "1001110111110100", 625 => "1010011100010110", 626 => "1011000001111000", 
    627 => "1011101000011011", 628 => "1100001111111101", 629 => "1100111000011111", 
    630 => "1101100010000001", 631 => "1110001100100011", 632 => "1110111000000011", 
    633 => "1111100100100011", 634 => "0000010010000010", 635 => "0001000000100000", 
    636 => "0001101111111100", 637 => "0010100000010110", 638 => "0011010001101111", 
    639 => "0100000100000110", 640 => "0100110111011011", 641 => "0101101011101101", 
    642 => "0110100000111100", 643 => "0111010111001001", 644 => "1000001110010010", 
    645 => "1001000110011000", 646 => "1001111111011011", 647 => "1010111001011010", 
    648 => "1011110100010101", 649 => "1100110000001100", 650 => "1101101100111110", 
    651 => "1110101010101011", 652 => "1111101001010100", 653 => "0000101000110111", 
    654 => "0001101001010100", 655 => "0010101010101100", 656 => "0011101100111110", 
    657 => "0100110000001010", 658 => "0101110100001111", 659 => "0110111001001101", 
    660 => "0111111111000100", 661 => "1001000101110011", 662 => "1010001101011011", 
    663 => "1011010101111010", 664 => "1100011111010010", 665 => "1101101001100001", 
    666 => "1110110100100111", 667 => "0000000000100011", 668 => "0001001101010110", 
    669 => "0010011011000000", 670 => "0011101001011111", 671 => "0100111000110011", 
    672 => "0110001000111101", 673 => "0111011001111100", 674 => "1000101011101111", 
    675 => "1001111110010110", 676 => "1011010001110010", 677 => "1100100110000000", 
    678 => "1101111011000010", 679 => "1111010000110111", 680 => "0000100111011110", 
    681 => "0001111110111000", 682 => "0011010111000011", 683 => "0100101111111111", 
    684 => "0110001001101101", 685 => "0111100100001011", 686 => "1000111111011001", 
    687 => "1010011011011000", 688 => "1011111000000110", 689 => "1101010101100011", 
    690 => "1110110011101111", 691 => "0000010010101001", 692 => "0001110010010001", 
    693 => "0011010010100111", 694 => "0100110011101010", 695 => "0110010101011010", 
    696 => "0111110111110110", 697 => "1001011010111111", 698 => "1010111110110011", 
    699 => "1100100011010010", 700 => "1110001000011100", 701 => "1111101110010001", 
    702 => "0001010100101111", 703 => "0010111011110111", 704 => "0100100011101000", 
    705 => "0110001100000010", 706 => "0111110101000100", 707 => "1001011110101110", 
    708 => "1011001000111111", 709 => "1100110011110111", 710 => "1110011111010110", 
    711 => "0000001011011011", 712 => "0001111000000110", 713 => "0011100101010110", 
    714 => "0101010011001010", 715 => "0111000001100011", 716 => "1000110000100000", 
    717 => "1010100000000000", 718 => "1100010000000011", 719 => "1110000000101001", 
    720 => "1111110001110001", 721 => "0001100011011010", 722 => "0011010101100100", 
    723 => "0101001000001111", 724 => "0110111011011010", 725 => "1000101111000101", 
    726 => "1010100011001111", 727 => "1100010111111000", 728 => "1110001100111111", 
    729 => "0000000010100100", 730 => "0001111000100111", 731 => "0011101111000110", 
    732 => "0101100110000001", 733 => "0111011101011000", 734 => "1001010101001011", 
    735 => "1011001101011001", 736 => "1101000110000001", 737 => "1110111111000011", 
    738 => "0000111000011110", 739 => "0010110010010010", 740 => "0100101100011111", 
    741 => "0110100111000011", 742 => "1000100001111111", 743 => "1010011101010010", 
    744 => "1100011000111011", 745 => "1110010100111010", 746 => "0000010001001111", 
    747 => "0010001101111000", 748 => "0100001010110110", 749 => "0110001000000111", 
    750 => "1000000101101100", 751 => "1010000011100100", 752 => "1100000001101110", 
    753 => "1110000000001010", 754 => "1111111110110111", 755 => "0001111101110101", 
    756 => "0011111101000011", 757 => "0101111100100001", 758 => "0111111100001110", 
    759 => "1001111100001010", 760 => "1011111100010100", 761 => "1101111100101011", 
    762 => "1111111101010000", 763 => "0001111110000001", 764 => "0011111110111111", 
    765 => "0110000000000111", 766 => "1000000001011011", 767 => "1010000010111001", 
    768 => "1100000100100010", 769 => "1110000110010011", 770 => "0000001000001110", 
    771 => "0010001010010001", 772 => "0100001100011011", 773 => "0110001110101101", 
    774 => "1000010001000110", 775 => "1010010011100101", 776 => "1100010110001001", 
    777 => "1110011000110011", 778 => "0000011011100010", 779 => "0010011110010100", 
    780 => "0100100001001010", 781 => "0110100100000011", 782 => "1000100110111110", 
    783 => "1010101001111100", 784 => "1100101100111011", 785 => "1110101111111010" );

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

entity get_trig_vals_sin_tables_low_V_3 is
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

architecture arch of get_trig_vals_sin_tables_low_V_3 is
    component get_trig_vals_sin_tables_low_V_3_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    get_trig_vals_sin_tables_low_V_3_rom_U :  component get_trig_vals_sin_tables_low_V_3_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


