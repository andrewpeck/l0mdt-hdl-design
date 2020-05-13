-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity get_trig_vals_sin_tables_low_V_14_rom is 
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


architecture rtl of get_trig_vals_sin_tables_low_V_14_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0001110110101011", 1 => "0011111001101011", 2 => "0101111100101001", 
    3 => "0111111111100110", 4 => "1010000010100001", 5 => "1100000101011001", 
    6 => "1110001000001110", 7 => "0000001010111111", 8 => "0010001101101100", 
    9 => "0100010000010101", 10 => "0110010010111000", 11 => "1000010101010101", 
    12 => "1010010111101100", 13 => "1100011001111011", 14 => "1110011100000100", 
    15 => "0000011110000100", 16 => "0010011111111100", 17 => "0100100001101011", 
    18 => "0110100011010001", 19 => "1000100100101100", 20 => "1010100101111100", 
    21 => "1100100111000010", 22 => "1110100111111100", 23 => "0000101000101001", 
    24 => "0010101001001010", 25 => "0100101001011110", 26 => "0110101001100100", 
    27 => "1000101001011011", 28 => "1010101001000100", 29 => "1100101000011101", 
    30 => "1110100111100110", 31 => "0000100110011111", 32 => "0010100101001000", 
    33 => "0100100011011110", 34 => "0110100001100011", 35 => "1000011111010101", 
    36 => "1010011100110101", 37 => "1100011010000000", 38 => "1110010110111000", 
    39 => "0000010011011011", 40 => "0010001111101010", 41 => "0100001011100010", 
    42 => "0110000111000101", 43 => "1000000010010001", 44 => "1001111101000110", 
    45 => "1011110111100100", 46 => "1101110001101001", 47 => "1111101011010110", 
    48 => "0001100100101010", 49 => "0011011101100100", 50 => "0101010110000100", 
    51 => "0111001110001010", 52 => "1001000101110101", 53 => "1010111101000100", 
    54 => "1100110011110111", 55 => "1110101010001110", 56 => "0000100000000111", 
    57 => "0010010101100011", 58 => "0100001010100010", 59 => "0101111111000010", 
    60 => "0111110011000011", 61 => "1001100110100100", 62 => "1011011001100110", 
    63 => "1101001100000111", 64 => "1110111110001000", 65 => "0000101111100111", 
    66 => "0010100000100101", 67 => "0100010001000001", 68 => "0110000000111010", 
    69 => "0111110000001111", 70 => "1001011111000010", 71 => "1011001101010000", 
    72 => "1100111010111010", 73 => "1110100111111111", 74 => "0000010100011110", 
    75 => "0010000000011000", 76 => "0011101011101011", 77 => "0101010110011000", 
    78 => "0111000000011110", 79 => "1000101001111100", 80 => "1010010010110010", 
    81 => "1011111011000000", 82 => "1101100010100101", 83 => "1111001001100001", 
    84 => "0000101111110011", 85 => "0010010101011011", 86 => "0011111010011001", 
    87 => "0101011110101011", 88 => "0111000010010010", 89 => "1000100101001110", 
    90 => "1010000111011101", 91 => "1011101001000000", 92 => "1101001001110110", 
    93 => "1110101001111110", 94 => "0000001001011001", 95 => "0001101000000110", 
    96 => "0011000110000100", 97 => "0100100011010011", 98 => "0101111111110011", 
    99 => "0111011011100011", 100 => "1000110110100100", 101 => "1010010000110011", 
    102 => "1011101010010011", 103 => "1101000011000000", 104 => "1110011010111101", 
    105 => "1111110010001000", 106 => "0001001000100000", 107 => "0010011110000110", 
    108 => "0011110010111001", 109 => "0101000110111000", 110 => "0110011010000100", 
    111 => "0111101100011100", 112 => "1000111110000000", 113 => "1010001110101111", 
    114 => "1011011110101001", 115 => "1100101101101110", 116 => "1101111011111101", 
    117 => "1111001001010111", 118 => "0000010101111010", 119 => "0001100001100110", 
    120 => "0010101100011100", 121 => "0011110110011011", 122 => "0100111111100010", 
    123 => "0110000111110001", 124 => "0111001111001000", 125 => "1000010101100111", 
    126 => "1001011011001101", 127 => "1010011111111010", 128 => "1011100011101110", 
    129 => "1100100110101001", 130 => "1101101000101010", 131 => "1110101001110000", 
    132 => "1111101001111101", 133 => "0000101001001111", 134 => "0001100111100110", 
    135 => "0010100101000010", 136 => "0011100001100010", 137 => "0100011101001000", 
    138 => "0101010111110001", 139 => "0110010001011110", 140 => "0111001010001111", 
    141 => "1000000010000011", 142 => "1000111000111011", 143 => "1001101110110101", 
    144 => "1010100011110011", 145 => "1011010111110011", 146 => "1100001010110101", 
    147 => "1100111100111010", 148 => "1101101110000000", 149 => "1110011110001000", 
    150 => "1111001101010010", 151 => "1111111011011101", 152 => "0000101000101010", 
    153 => "0001010100110111", 154 => "0010000000000101", 155 => "0010101010010100", 
    156 => "0011010011100011", 157 => "0011111011110010", 158 => "0100100011000010", 
    159 => "0101001001010010", 160 => "0101101110100001", 161 => "0110010010110000", 
    162 => "0110110101111111", 163 => "0111011000001100", 164 => "0111111001011010", 
    165 => "1000011001100110", 166 => "1000111000110001", 167 => "1001010110111011", 
    168 => "1001110100000100", 169 => "1010010000001011", 170 => "1010101011010001", 
    171 => "1011000101010101", 172 => "1011011110010111", 173 => "1011110110011000", 
    174 => "1100001101010110", 175 => "1100100011010011", 176 => "1100111000001101", 
    177 => "1101001100000101", 178 => "1101011110111011", 179 => "1101110000101111", 
    180 => "1110000001100000", 181 => "1110010001001110", 182 => "1110011111111010", 
    183 => "1110101101100100", 184 => "1110111010001010", 185 => "1111000101101110", 
    186 => "1111010000001111", 187 => "1111011001101101", 188 => "1111100010001001", 
    189 => "1111101001100001", 190 => "1111101111110111", 191 => "1111110101001001", 
    192 => "1111111001011001", 193 => "1111111100100101", 194 => "1111111110101111", 
    195 => "1111111111110101", 196 => "1111111111111001", 197 => "1111111110111001", 
    198 => "1111111100110111", 199 => "1111111001110001", 200 => "1111110101101000", 
    201 => "1111110000011101", 202 => "1111101010001110", 203 => "1111100010111100", 
    204 => "1111011010101000", 205 => "1111010001010001", 206 => "1111000110110110", 
    207 => "1110111011011001", 208 => "1110101110111010", 209 => "1110100001010111", 
    210 => "1110010010110010", 211 => "1110000011001010", 212 => "1101110010100000", 
    213 => "1101100000110100", 214 => "1101001110000100", 215 => "1100111010010011", 
    216 => "1100100101100000", 217 => "1100001111101010", 218 => "1011111000110010", 
    219 => "1011100000111000", 220 => "1011000111111101", 221 => "1010101101111111", 
    222 => "1010010011000000", 223 => "1001110111000000", 224 => "1001011001111110", 
    225 => "1000111011111011", 226 => "1000011100110110", 227 => "0111111100110001", 
    228 => "0111011011101010", 229 => "0110111001100011", 230 => "0110010110011011", 
    231 => "0101110010010011", 232 => "0101001101001010", 233 => "0100100111000001", 
    234 => "0011111111111000", 235 => "0011010111101111", 236 => "0010101110100110", 
    237 => "0010000100011110", 238 => "0001011001010110", 239 => "0000101101010000", 
    240 => "0000000000001010", 241 => "1111010010000101", 242 => "1110100011000010", 
    243 => "1101110011000000", 244 => "1101000010000000", 245 => "1100010000000010", 
    246 => "1011011101000110", 247 => "1010101001001100", 248 => "1001110100010101", 
    249 => "1000111110100001", 250 => "1000000111101111", 251 => "0111010000000001", 
    252 => "0110010111010111", 253 => "0101011101110000", 254 => "0100100011001100", 
    255 => "0011100111101110", 256 => "0010101011010011", 257 => "0001101101111101", 
    258 => "0000101111101100", 259 => "1111110000100000", 260 => "1110110000011010", 
    261 => "1101101111011001", 262 => "1100101101011110", 263 => "1011101010101010", 
    264 => "1010100110111100", 265 => "1001100010010100", 266 => "1000011100110100", 
    267 => "0111010110011011", 268 => "0110001111001001", 269 => "0101000111000000", 
    270 => "0011111101111111", 271 => "0010110100000110", 272 => "0001101001010110", 
    273 => "0000011101101111", 274 => "1111010001010001", 275 => "1110000011111110", 
    276 => "1100110101110100", 277 => "1011100110110100", 278 => "1010010111000000", 
    279 => "1001000110010110", 280 => "0111110100111000", 281 => "0110100010100101", 
    282 => "0101001111011110", 283 => "0011111011100100", 284 => "0010100110110110", 
    285 => "0001010001010110", 286 => "1111111011000011", 287 => "1110100011111101", 
    288 => "1101001100000110", 289 => "1011110011011101", 290 => "1010011010000011", 
    291 => "1000111111111000", 292 => "0111100100111101", 293 => "0110001001010001", 
    294 => "0100101100110110", 295 => "0011001111101100", 296 => "0001110001110011", 
    297 => "0000010011001011", 298 => "1110110011110101", 299 => "1101010011110001", 
    300 => "1011110011000000", 301 => "1010010001100010", 302 => "1000101111010111", 
    303 => "0111001100100000", 304 => "0101101000111101", 305 => "0100000100101111", 
    306 => "0010011111110110", 307 => "0000111010010010", 308 => "1111010100000100", 
    309 => "1101101101001101", 310 => "1100000101101100", 311 => "1010011101100011", 
    312 => "1000110100110000", 313 => "0111001011010110", 314 => "0101100001010101", 
    315 => "0011110110101100", 316 => "0010001011011100", 317 => "0000011111100110", 
    318 => "1110110011001011", 319 => "1101000110001010", 320 => "1011011000100100", 
    321 => "1001101010011001", 322 => "0111111011101011", 323 => "0110001100011000", 
    324 => "0100011100100011", 325 => "0010101100001011", 326 => "0000111011010001", 
    327 => "1111001001110101", 328 => "1101010111111000", 329 => "1011100101011010", 
    330 => "1001110010011011", 331 => "0111111110111101", 332 => "0110001010111111", 
    333 => "0100010110100010", 334 => "0010100001100111", 335 => "0000101100001110", 
    336 => "1110110110010111", 337 => "1101000000000100", 338 => "1011001001010011", 
    339 => "1001010010000111", 340 => "0111011010011111", 341 => "0101100010011100", 
    342 => "0011101001111111", 343 => "0001110001000111", 344 => "1111110111110110", 
    345 => "1101111110001100", 346 => "1100000100001001", 347 => "1010001001101110", 
    348 => "1000001110111011", 349 => "0110010011110001", 350 => "0100011000010001", 
    351 => "0010011100011010", 352 => "0000100000001110", 353 => "1110100011101101", 
    354 => "1100100110111000", 355 => "1010101001101110", 356 => "1000101100010000", 
    357 => "0110101110100000", 358 => "0100110000011101", 359 => "0010110010001000", 
    360 => "0000110011100010", 361 => "1110110100101011", 362 => "1100110101100011", 
    363 => "1010110110001011", 364 => "1000110110100100", 365 => "0110110110101110", 
    366 => "0100110110101010", 367 => "0010110110011000", 368 => "0000110101111000", 
    369 => "1110110101001100", 370 => "1100110100010011", 371 => "1010110011001111", 
    372 => "1000110001111111", 373 => "0110110000100101", 374 => "0100101111000001", 
    375 => "0010101101010011", 376 => "0000101011011100", 377 => "1110101001011100", 
    378 => "1100100111010101", 379 => "1010100101000110", 380 => "1000100010110000", 
    381 => "0110100000010011", 382 => "0100011101110001", 383 => "0010011011001001", 
    384 => "0000011000011100", 385 => "1110010101101011", 386 => "1100010010110111", 
    387 => "1010001111111111", 388 => "1000001101000100", 389 => "0110001010001000", 
    390 => "0100000111001001", 391 => "0010000100001010", 392 => "0000000001001010", 
    393 => "1101111110001010", 394 => "1011111011001011", 395 => "1001111000001101", 
    396 => "0111110101010000", 397 => "0101110010010101", 398 => "0011101111011101", 
    399 => "0001101100101001", 400 => "1111101001111000", 401 => "1101100111001011", 
    402 => "1011100100100011", 403 => "1001100010000001", 404 => "0111011111100100", 
    405 => "0101011101001110", 406 => "0011011010111111", 407 => "0001011000110111", 
    408 => "1111010110110111", 409 => "1101010101000000", 410 => "1011010011010010", 
    411 => "1001010001101101", 412 => "0111010000010011", 413 => "0101001111000011", 
    414 => "0011001101111111", 415 => "0001001101000110", 416 => "1111001100011001", 
    417 => "1101001011111010", 418 => "1011001011100111", 419 => "1001001011100011", 
    420 => "0111001011101100", 421 => "0101001100000101", 422 => "0011001100101101", 
    423 => "0001001101100101", 424 => "1111001110101101", 425 => "1101010000000111", 
    426 => "1011010001110010", 427 => "1001010011101110", 428 => "0111010101111110", 
    429 => "0101011000100000", 430 => "0011011011010110", 431 => "0001011110100000", 
    432 => "1111100001111110", 433 => "1101100101110010", 434 => "1011101001111011", 
    435 => "1001101110011010", 436 => "0111110011010000", 437 => "0101111000011101", 
    438 => "0011111110000010", 439 => "0010000011111110", 440 => "0000001010010100", 
    441 => "1110010001000010", 442 => "1100011000001010", 443 => "1010011111101100", 
    444 => "1000100111101000", 445 => "0110110000000000", 446 => "0100111000110011", 
    447 => "0011000010000010", 448 => "0001001011101110", 449 => "1111010101110111", 
    450 => "1101100000011101", 451 => "1011101011100010", 452 => "1001110111000100", 
    453 => "1000000011000110", 454 => "0110001111100111", 455 => "0100011100101000", 
    456 => "0010101010001010", 457 => "0000111000001100", 458 => "1111000110101111", 
    459 => "1101010101110100", 460 => "1011100101011100", 461 => "1001110101100110", 
    462 => "1000000110010011", 463 => "0110010111100100", 464 => "0100101001011001", 
    465 => "0010111011110010", 466 => "0001001110110000", 467 => "1111100010010100", 
    468 => "1101110110011101", 469 => "1100001011001101", 470 => "1010100000100100", 
    471 => "1000110110100001", 472 => "0111001101000110", 473 => "0101100100010100", 
    474 => "0011111100001001", 475 => "0010010100101000", 476 => "0000101101101111", 
    477 => "1111000111100001", 478 => "1101100001111101", 479 => "1011111101000011", 
    480 => "1010011000110100", 481 => "1000110101010000", 482 => "0111010010011001", 
    483 => "0101110000001101", 484 => "0100001110101110", 485 => "0010101101111100", 
    486 => "0001001101110111", 487 => "1111101110100001", 488 => "1110001111111000", 
    489 => "1100110001111110", 490 => "1011010100110010", 491 => "1001111000010111", 
    492 => "1000011100101010", 493 => "0111000001101110", 494 => "0101100111100010", 
    495 => "0100001110000111", 496 => "0010110101011110", 497 => "0001011101100101", 
    498 => "0000000110011111", 499 => "1110110000001011", 500 => "1101011010101010", 
    501 => "1100000101111011", 502 => "1010110010000000", 503 => "1001011110111000", 
    504 => "1000001100100101", 505 => "0110111011000101", 506 => "0101101010011011", 
    507 => "0100011010100101", 508 => "0011001011100101", 509 => "0001111101011010", 
    510 => "0000110000000101", 511 => "1111100011100111", 512 => "1110010111111111", 
    513 => "1101001101001110", 514 => "1100000011010100", 515 => "1010111010010010", 
    516 => "1001110010000111", 517 => "1000101010110101", 518 => "0111100100011011", 
    519 => "0110011110111010", 520 => "0101011010010001", 521 => "0100010110100010", 
    522 => "0011010011101100", 523 => "0010010001110000", 524 => "0001010000101111", 
    525 => "0000010000100111", 526 => "1111010001011010", 527 => "1110010011001000", 
    528 => "1101010101110001", 529 => "1100011001010110", 530 => "1011011101110110", 
    531 => "1010100011010010", 532 => "1001101001101010", 533 => "1000110000111110", 
    534 => "0111111001001111", 535 => "0111000010011100", 536 => "0110001100100111", 
    537 => "0101010111101111", 538 => "0100100011110100", 539 => "0011110000110111", 
    540 => "0010111110111000", 541 => "0010001101110110", 542 => "0001011101110011", 
    543 => "0000101110101111", 544 => "0000000000101001", 545 => "1111010011100010", 
    546 => "1110100111011010", 547 => "1101111100010010", 548 => "1101010010001000", 
    549 => "1100101000111110", 550 => "1100000000110100", 551 => "1011011001101010", 
    552 => "1010110011100000", 553 => "1010001110010110", 554 => "1001101010001101", 
    555 => "1001000111000100", 556 => "1000100100111011", 557 => "1000000011110100", 
    558 => "0111100011101101", 559 => "0111000100100111", 560 => "0110100110100011", 
    561 => "0110001001100000", 562 => "0101101101011110", 563 => "0101010010011110", 
    564 => "0100111000011111", 565 => "0100011111100011", 566 => "0100000111101000", 
    567 => "0011110000101111", 568 => "0011011010111000", 569 => "0011000110000011", 
    570 => "0010110010010000", 571 => "0010011111100000", 572 => "0010001101110010", 
    573 => "0001111101000111", 574 => "0001101101011110", 575 => "0001011110111000", 
    576 => "0001010001010100", 577 => "0001000100110011", 578 => "0000111001010101", 
    579 => "0000101110111010", 580 => "0000100101100001", 581 => "0000011101001011", 
    582 => "0000010101111001", 583 => "0000001111101001", 584 => "0000001010011100", 
    585 => "0000000110010010", 586 => "0000000011001011", 587 => "0000000001001000", 
    588 => "0000000000000111", 589 => "0000000000001001", 590 => "0000000001001110", 
    591 => "0000000011010111", 592 => "0000000110100010", 593 => "0000001010110000", 
    594 => "0000010000000010", 595 => "0000010110010110", 596 => "0000011101101101", 
    597 => "0000100110000111", 598 => "0000101111100100", 599 => "0000111010000100", 
    600 => "0001000101100111", 601 => "0001010010001100", 602 => "0001011111110101", 
    603 => "0001101110011111", 604 => "0001111110001101", 605 => "0010001110111101", 
    606 => "0010100000101111", 607 => "0010110011100100", 608 => "0011000111011011", 
    609 => "0011011100010100", 610 => "0011110010001111", 611 => "0100001001001101", 
    612 => "0100100001001100", 613 => "0100111010001101", 614 => "0101010100010000", 
    615 => "0101101111010101", 616 => "0110001011011011", 617 => "0110101000100010", 
    618 => "0111000110101011", 619 => "0111100101110101", 620 => "1000000110000000", 
    621 => "1000100111001100", 622 => "1001001001011001", 623 => "1001101100100110", 
    624 => "1010010000110100", 625 => "1010110110000010", 626 => "1011011100010001", 
    627 => "1100000011011111", 628 => "1100101011101110", 629 => "1101010100111100", 
    630 => "1101111111001001", 631 => "1110101010010110", 632 => "1111010110100010", 
    633 => "0000000011101110", 634 => "0000110001111000", 635 => "0001100001000000", 
    636 => "0010010001000111", 637 => "0011000010001101", 638 => "0011110100010000", 
    639 => "0100100111010001", 640 => "0101011011010000", 641 => "0110010000001101", 
    642 => "0111000110000110", 643 => "0111111100111101", 644 => "1000110100110000", 
    645 => "1001101101100000", 646 => "1010100111001100", 647 => "1011100001110100", 
    648 => "1100011101011000", 649 => "1101011001111000", 650 => "1110010111010011", 
    651 => "1111010101101001", 652 => "0000010100111001", 653 => "0001010101000101", 
    654 => "0010010110001011", 655 => "0011011000001010", 656 => "0100011011000100", 
    657 => "0101011110110111", 658 => "0110100011100011", 659 => "0111101001001000", 
    660 => "1000101111100110", 661 => "1001110110111100", 662 => "1010111111001011", 
    663 => "1100001000010001", 664 => "1101010010001110", 665 => "1110011101000011", 
    666 => "1111101000101110", 667 => "0000110101010001", 668 => "0010000010101001", 
    669 => "0011010000110111", 670 => "0100011111111011", 671 => "0101101111110100", 
    672 => "0111000000100011", 673 => "1000010010000101", 674 => "1001100100011101", 
    675 => "1010110111101000", 676 => "1100001011100110", 677 => "1101100000011000", 
    678 => "1110110101111101", 679 => "0000001100010101", 680 => "0001100011011110", 
    681 => "0010111011011010", 682 => "0100010100000111", 683 => "0101101101100101", 
    684 => "0111000111110100", 685 => "1000100010110100", 686 => "1001111110100011", 
    687 => "1011011011000010", 688 => "1100111000010001", 689 => "1110010110001110", 
    690 => "1111110100111010", 691 => "0001010100010100", 692 => "0010110100011011", 
    693 => "0100010101010000", 694 => "0101110110110010", 695 => "0111011001000001", 
    696 => "1000111011111100", 697 => "1010011111100010", 698 => "1100000011110100", 
    699 => "1101101000110000", 700 => "1111001110011000", 701 => "0000110100101001", 
    702 => "0010011011100100", 703 => "0100000011001000", 704 => "0101101011010101", 
    705 => "0111010100001011", 706 => "1000111101101000", 707 => "1010100111101101", 
    708 => "1100010010011010", 709 => "1101111101101100", 710 => "1111101001100110", 
    711 => "0001010110000100", 712 => "0011000011001001", 713 => "0100110000110010", 
    714 => "0110011110111111", 715 => "1000001101110001", 716 => "1001111101000110", 
    717 => "1011101100111110", 718 => "1101011101011001", 719 => "1111001110010110", 
    720 => "0000111111110101", 721 => "0010110001110101", 722 => "0100100100010110", 
    723 => "0110010111010111", 724 => "1000001010111000", 725 => "1001111110111001", 
    726 => "1011110011011000", 727 => "1101101000010110", 728 => "1111011101110010", 
    729 => "0001010011101011", 730 => "0011001010000001", 731 => "0101000000110100", 
    732 => "0110111000000010", 733 => "1000101111101100", 734 => "1010100111110010", 
    735 => "1100100000010001", 736 => "1110011001001011", 737 => "0000010010011111", 
    738 => "0010001100001011", 739 => "0100000110010000", 740 => "0110000000101101", 
    741 => "0111111011100010", 742 => "1001110110101101", 743 => "1011110010010000", 
    744 => "1101101110001000", 745 => "1111101010010110", 746 => "0001100110111001", 
    747 => "0011100011110000", 748 => "0101100000111100", 749 => "0111011110011011", 
    750 => "1001011100001100", 751 => "1011011010010001", 752 => "1101011000100111", 
    753 => "1111010111001111", 754 => "0001010110001000", 755 => "0011010101010001", 
    756 => "0101010100101010", 757 => "0111010100010010", 758 => "1001010100001010", 
    759 => "1011010100001111", 760 => "1101010100100011", 761 => "1111010101000011", 
    762 => "0001010101110001", 763 => "0011010110101010", 764 => "0101010111101111", 
    765 => "0111011001000000", 766 => "1001011010011011", 767 => "1011011100000000", 
    768 => "1101011101101111", 769 => "1111011111100111", 770 => "0001100001100111", 
    771 => "0011100011101111", 772 => "0101100101111111", 773 => "0111101000010110", 
    774 => "1001101010110011", 775 => "1011101101010101", 776 => "1101101111111110", 
    777 => "1111110010101011", 778 => "0001110101011100", 779 => "0011111000010001", 
    780 => "0101111011001001", 781 => "0111111110000100", 782 => "1010000001000000", 
    783 => "1100000011111111", 784 => "1110000110111110", 785 => "0000000000000000" );

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

entity get_trig_vals_sin_tables_low_V_14 is
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

architecture arch of get_trig_vals_sin_tables_low_V_14 is
    component get_trig_vals_sin_tables_low_V_14_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    get_trig_vals_sin_tables_low_V_14_rom_U :  component get_trig_vals_sin_tables_low_V_14_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


