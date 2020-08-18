import os
import struct

from .events import DataWord, timing_info_gen



N_BYTES_PER_WORD = 9
N_WORDS_FOR_EVENT_HEADER = 6
N_WORDS_FOR_MODULE_HEADER = 2
N_WORDS_FOR_EVENT_FOOTER = 3
DATA_ENDIAN = "little"


