import re
import numpy as np
import os
import json
from columnar import columnar

from . import events
from . import result_handler
from colorama import Fore, Back, Style, init

init(autoreset=True)
# Fore: BLACK, RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN, WHITE, RESET.
# Back: BLACK, RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN, WHITE, RESET.
# Style: DIM, NORMAL, BRIGHT, RESET_ALL


def remove_ansi(instring):
    """
    Remove ANSI color codes from an input string "instring".

    Note:
        From https://stackoverflow.com/questions/14693701/how-can-i-remove-the-ansi-escape-sequences-from-a-string-in-python
    """

    ansi_escape = re.compile(r"\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])")
    return ansi_escape.sub("", instring)


def event_at_l0id(events_list, l0id):
    """
    From an input list of events, "events_list", find the event with L0ID "l0id".

    inputs:
        events_list -> list(tb_utils.events.DataEvent)
        l0id -> int: L0ID of the event we want
    returns:
        output_event -> tb_utils.events.DataEvent
    """

    output_event = None
    for e in events_list:
        if int(e.l0id) == int(l0id):
            output_event = e
            break
            # return e
    return output_event


def meta_field_diff(event0, event1, meta_type="event_header"):
    """
    Perform the diff of the header/footer information of the input events or modules, "event0" and "event1".

    This function does a comparison of the values of the decoded bit-fields within
    the headers and footers. It generates the output to print to stdout
    with the datawords as well as human-readable descriptions of the decoded
    fields (names and values). Also indicated are the location of differences
    of the bit-field values (in color).


    inputs:
        event0 -> tb_utils.events.DataEvent or tb_utils.events.ModuleData: Event or module associated with input file 0
        event1 -> tb_utils.events.Dataevent or tb_utils.events.ModuleData: Event or module associated with input file 1
        meta_type -> str: String indicating which type of meta fields should be decoded,
                            possible values are "event_header", "event_footer", "module_header", and "module_footer"

    returns:
        -> str: Descriptions of meta field data
    bad_fields -> list(str): List of any of the header/footer fields at which an error is found
    """

    h0 = []
    valid_meta_types = [
        "event_header",
        "event_footer",
        "module_header",
        "module_footer",
    ]
    if meta_type not in valid_meta_types:
        raise ValueError(
            f'ERROR "meta_type" can only take values: {[x for x in valid_meta_types]}'
        )

    meta_field_names = None
    field_func0 = None
    field_func1 = None
    if meta_type == "event_header" or meta_type == "module_header":
        meta_field_names = event0.header_field_names()
        field_func0 = event0.header_field
        field_func1 = event1.header_field
    elif meta_type == "event_footer" or meta_type == "module_footer":
        meta_field_names = event0.footer_field_names()
        field_func0 = event0.footer_field
        field_func1 = event1.footer_field

    bad_fields = []
    for ih, field_names_i in enumerate(meta_field_names):
        h0_i = []
        for ifield, field_name in enumerate(field_names_i):

            field0 = field_func0(field_name)
            field1 = field_func1(field_name)

            bad_flag0 = False
            bad_flag1 = False
            valid_flags = [0xAB, 0x55, 0x77, 0xCD]
            if field_name == "FLAG" and field0 not in valid_flags:
                bad_flag0 = True
            if field_name == "FLAG" and field1 not in valid_flags:
                bad_flag1 = True
            bad_flag = bad_flag0 or bad_flag1

            error = ""
            if field0 != field1 or bad_flag:
                color = Fore.RED
                error = " DIFFERROR"
                bad_fields.append(field_name)
            else:
                color = Fore.GREEN
            prev0 = f"{field_name}{error}:{hex(int(field0))}"
            prev1 = f"{field_name}{error}:{hex(int(field1))}"
            if (
                event0 is event1
            ):  # handles the case when providing the same inputs twice
                out_str = color + f"{prev0.replace(':', ': ')}"
            else:
                out_str = color + f"{prev0.replace(':', ': ')} / {prev1.split(':')[-1]}"
            h0_i.append(out_str)
        h0.append(h0_i)

    ##
    ## set all strings to be fixed length
    ##
    col_width_0 = max(len(word) for row in h0 for word in row[:-1]) + 2

    tmp0 = []
    for row in h0:
        tmp = [word.ljust(col_width_0) for word in row]
        tmp0.append(tmp)
    h0 = tmp0
    return h0, list(set(bad_fields))


def colored_dataword(dataword, bad_pos=[]):
    """
    Return the hex-string representation of the input data word, "dataword",
    with the characters at indices indicated at positions within the
    input array "bad_pos" colored in RED.

    Note:
        Lengths of string representations of "dataword" before and after
        calls to this function will differ as a result of the ANSI color
        codes that are added to the output strings.

    inputs:
        dataword -> tb_utils.events.DataWord
        bad_pos -> list(int): List of indices within the hex-string representation of "dataword"
                                that should be colored RED.
    returns:
        output_word -> str: Colored hex-string representation of "dataword"
    """

    hex_string = str(dataword)
    output_word = ""
    for idx, char in enumerate(hex_string):

        if idx in bad_pos:
            output_word += Fore.RED + char
            output_word += Style.RESET_ALL
        else:
            # make it green for fun
            # output_word += Fore.RESET + char
            output_word += Fore.GREEN + char
    return output_word


def diff_data_words(word0, word1, pass_through=False, mask=[], colorize=True):
    """
    Perform the comparison between two data words, "word0" and "word1".

    This function first produces a list of characters appearing in the hex-string
    format of each word's data. The comparison of each word is performed by
    essentially doing a string comparison between these two hex-strings.

    inputs:
        word0 -> tb_utils.events.DataWord: Data word associated with an event from input file 0
        word1 -> tb_utils.events.DataWord: Data word associated with an event from input file 1
        pass_through -> bool: If True this function does not perform the word comparison,
                                effectively treating them as being equal to one another
        mask -> list(int): List of positions within the hex-string representation of
                            the input data-words at which to ignore differences.
        colorize -> bool: Indicate by color where different parts of each word are.
    returns:
        out0 -> str: hex-string representation of word0
        out1 -> str: hex-string representation of word1
        diff -> array(bool): Array of bools indicating which indices of the hex-string representation
                                of "word0" and "word1" occur (True: difference, False: equal)
    """

    word0_nibbles, word1_nibbles = list(str(word0)), list(str(word1))
    # the str representation of events.DataWord should always represent data as 65-bits
    if len(word0_nibbles) != len(word1_nibbles):
        raise Exception(
            f"ERROR Incorrect data word lengths (word0={len(str(word0))}, word1={len(str(word1))})"
        )

    bad_nibbles = []
    for i in range(len(word0_nibbles)):
        nibble0 = word0_nibbles[i]
        nibble1 = word1_nibbles[i]
        if nibble0 != nibble1 and i not in mask:
            bad_nibbles.append(i)

    if pass_through:
        bad_nibbles = []

    diff = []
    for i in range(len(word0_nibbles)):
        if i in bad_nibbles and i not in mask:
            diff.append(True)
        else:
            diff.append(False)

    out0, out1 = str(word0), str(word1)
    if colorize:
        out0, out1 = (
            colored_dataword(word0, bad_nibbles),
            colored_dataword(word1, bad_nibbles),
        )
    return out0, out1, diff


def diff_str(diff_arr):
    """
    Given an input array, produce a string with the "^" character at index
    positions in the array that are True, and " " otherwise.

    Example:

        >>> diff_array = [False, False, False, True, True, False]
        >>> output = diff_str(diff_array)
        >>> print(output)
        '   ^^ ' # 3 blanks, 2 * "^", 1 blank

    inputs:
        diff_array -> list(bool)

    returns:
        d -> str
    """

    d = ""
    for x in diff_arr:
        if x:
            d += "^"
        else:
            d += " "
    return d


def diffprint(word0, word1, diff, indent="", description=""):
    """
    Function to print out the two input datawords, "word0" and "word1", as
    strings. Any differences between the two dataword will be highlighted
    in RED (in stdout). If there are differences between the two words a
    carat "^" character will appear in the subsequent line beneath the printout
    of the datawords beneath the portion of the data words where the differences
    are present. The positions of the differences in the hex-string of the dataword
    are provided by the input "diff", which is a list of indices.

    inputs:
        word0 -> tb_utils.events.DataWord
        word1 -> tb_utils.events.DataWord
        diff -> list: List of bools indicating True where differences lie in the input data words
        indent -> str: indent character string to pre-pend to any output
        description -> str: description to be appended to any output

    returns:
        None
    """

    word0_str = str(word0)
    word1_str = str(word1)

    if not description:
        print(f"{indent} {word0_str: <20}  {word1_str: <20}")
    else:
        print(f"{indent} {word0_str: <20}  {word1_str: <20}  {description}")

    # if not is_uneven :
    if np.any(np.array(diff)):
        dstr = diff_str(diff)
        print(f"{indent} {dstr: <20} {dstr: <20}")


def order_modules(modules0, modules1):
    """
    Line up matching modules from the list of modules "module0" and "module1".

    This function is needed since we do not have the guarantee that the modules
    appear in the same order in the provided testvectors as they are ordered
    by the actual firmware logic block under test. We find the modules that
    are equal (using the tb_utils.events.ModuleData.__eq__ operator, "==")
    and provide them as output in the same order.

    Modules that are unpaired (i.e. that only appear in one of the input lists)
    are added to output lists and returned as well.

    inputs:
        modules0 -> list: List of modules (tb_utils.events.ModuleData) from input file 0
        modules1 -> list: List of modules (tb_utils.events.ModuleData) from input file 1

    returns:
        out_0 -> list: Aligned list of modules from input file 0
        out_1 -> list: Aligned list of modules from input file 1
        unmatched_0 -> list: Modules from input file 0 that did not have a match in the
                                list of modules from input file 1
        unmatched_1 -> list: Modules from input file 1 that did not have a match in the
                                list of modules from input file 0
    """

    ##
    ## assume same # of modules
    ##
    out_0, out_1 = [], []
    idx_matched_0, idx_matched_1 = [], []

    unmatched_0, unmatched_1 = [], []

    # error_reasons = set()
    for imodule0 in range(len(modules0)):
        module0 = modules0[imodule0]
        for imodule1 in range(len(modules1)):
            module1 = modules1[imodule1]

            ##
            ## equality based on header/footer and number of module data words
            ##
            if module0 == module1:
                already_matched = module0 in out_0
                already_matched = already_matched and (module1 in out_1)
                if not already_matched:
                    idx_matched_0.append(imodule0)
                    out_0.append(module0)

                    idx_matched_1.append(imodule1)
                    out_1.append(module1)
            # else :
            #    len_ok = len(module0) == len(module1)
            #    h0, h1 = [x.value for x in module0.header_words], [x.value for x in module1.header_words]
            #    f0, f1 = module0.footer.value, module1.footer.value
            #    headers_ok = h0 == h1
            #    footers_ok = f0 == f1
            #    if not len_ok :
            #        error_reasons.add("MODULE_LENGTH")
            #    if not headers_ok :
            #        error_reasons.add("MODULE_HEADER")
            #    if not footers_ok :
            #        error_reasons.add("MODULE_FOOTER")

    for imodule0 in range(len(modules0)):
        if imodule0 not in idx_matched_0:
            unmatched_0.append(modules0[imodule0])
            # error_reasons.add("MODULE_UNMATCHED")
    for imodule1 in range(len(modules1)):
        if imodule1 not in idx_matched_1:
            unmatched_1.append(modules1[imodule1])
            # error_reasons.add("MODULE_UNMATCHED")

    return out_0, out_1, unmatched_0, unmatched_1


def module_footer_start_idx(data_word):
    """
    From a module footer dataword (full 65-bit dataword), find the
    starting index of footer.

    For example:
        If the data word is 0x11234577abcd (arbitrary), this function returns 8
        (i.e. the "0x" is included in the hex string position count).

    inputs:
        data_word -> tb_utils.events.DataWord: DataWord for the module footer

    returns:
        -> int: index of string representation of the hex-formatted data word, -1
                if is not a module footer word.
    """

    hex_str = str(data_word)
    hex_str_rev = "".join(list(hex_str)[::-1])
    back_idx = -1
    for i in range(0, len(hex_str_rev) - 1, 2):
        byte = hex_str_rev[i : i + 2]
        if byte == "77":
            back_idx = i + 2
    idx = len(hex_str) - back_idx
    return idx


def event_is_equal(event0, event1, verbose=False):
    """
    Compare two events, "event0" and "event1", to each other.
    Performs word-for-word (bit-for-bit) comparison of:
        1) event headers
        2) module headers
        3) module footers
        4) event footers
    Checks that the number of modules, as well as the module lengths (number
    of data words in a module) are the same between event0 and event1.

    Note:
        Right now the module (cluster) data are not checked.

    Note:
        Module ordering within the two events are not expected to be the
        same, so their order is *not* enforced to be the same.

    inputs:
        event0 -> tb_utils.events.DataEvent : An event from the first input file
        event1 -> tb_utils.events.DataEvent : An event from the second input file
        verbose -> bool : Flag for printing output

    returns:
        -> bool : True if events are found to be equal, False if not
    """

    all_ok = True
    event_test_results = {
        "n_words": [True, None],
        "event_header": [True, None],
        "event_footer": [True, None],
        "module_count": [True, None],
        "module_data": [True, None],
        "floating_data": [True, None],
    }

    indent = f"{'': <10}"
    ###########################################################################
    ###########################################################################
    ##
    ## Check that the number of data words in each event are the same
    ##
    ###########################################################################
    ###########################################################################
    n_words_0, n_words_1 = len(event0), len(event1)
    n_mod_0, n_mod_1 = event0.n_modules, event1.n_modules
    n_0_str = f"NWORDS   = {n_words_0}"
    n_1_str = f"NWORDS   = {n_words_1}"
    word_str = f"{n_0_str: <20} {n_1_str:<20}"

    err = ""
    event_test_results["n_words"] = [
        n_words_0 == n_words_1,
        {"n_words_0": n_words_0, "n_words_1": n_words_1},
    ]
    if n_words_0 != n_words_1:
        all_ok = False

        word_str = Fore.RED + word_str + Fore.RESET
        err = Fore.RED + "DIFFERROR" + Fore.RESET

    if verbose:
        print(f"{indent} {word_str} {err: <20}")

    n_0_str = f"NMODULES = {n_mod_0}"
    n_1_str = f"NMODULES = {n_mod_1}"
    mod_str = f"{n_0_str: <20} {n_1_str: <20}"

    err = ""
    event_test_results["module_count"] = [
        n_mod_0 == n_mod_1,
        {"n_modules_0": n_mod_0, "n_modules_1": n_mod_1},
    ]
    if n_mod_0 != n_mod_1:
        all_ok = False

        mod_str = Fore.RED + mod_str + Fore.RESET
        err = Fore.RED + "DIFFERROR" + Fore.RESET

    if verbose:
        print(f"{indent} {mod_str} {err: <20}")

    ###########################################################################
    ###########################################################################
    ##
    ## Compare the event headers
    ##
    ###########################################################################
    ###########################################################################
    if verbose:
        print(f"{indent} {'':-^40}")

    header_data_0, header_data_1 = event0.header_words, event1.header_words

    if len(header_data_0) != len(header_data_1):
        raise Exception("ERROR Malformed headers")
    header_length = len(header_data_0)

    for i in range(header_length):
        h0 = header_data_0[i]
        h1 = header_data_1[i]
        h0, h1, diff = diff_data_words(h0, h1)
        header_diff_strings, bad_fields = meta_field_diff(
            event0, event1, meta_type="event_header"
        )
        description = " ".join(header_diff_strings[i])

        if bad_fields:
            event_test_results["event_header"] = [False, {"bad_fields": bad_fields}]

        if verbose:
            diffprint(h0, h1, diff, indent=indent, description=description)

        if np.any(np.array(diff)):
            all_ok = False
            if not bad_fields:
                raise Exception(
                    "ERROR We have event header dataword differences but no registered bad fields!"
                )

    ###########################################################################
    ###########################################################################
    ##
    ## Compare the events' module data
    ##
    ###########################################################################
    ###########################################################################
    modules_0, modules_1 = event0.get_modules(), event1.get_modules()

    ##
    ## Order modules between the events in each of the provided event lists
    ## (this is needed since the provided testvectors may order the module
    ## data differently than the actual firmware block).
    ##
    ## Here, "unmatched" modules are those that do not appear in both
    ## events.
    ##
    modules_0, modules_1, unmatched_modules_0, unmatched_modules_1 = order_modules(
        modules_0, modules_1
    )

    ##
    ## matched modules
    ##
    for imodule in range(len(modules_0)):
        module0 = modules_0[imodule]
        module1 = modules_1[imodule]

        if verbose:
            print(f"{indent} {'':-^40}")

        for iword in range(len(module0)):
            module_word0 = module0.data_words[iword]
            module_word1 = module1.data_words[iword]

            pass_through = False  # allow this word to pass the check
            mask = []  # mask any bits that we don't want to consider for comparison

            if iword == 1:
                ##
                ## First 32-bits of second module word are header, but the
                ## rest are data. As we are not (at the moment) comparing/checking
                ## cluster-level data, mask the cluster data in this header-containing
                ## word but do not mask the header information (which we ARE
                ## comparing/checking).
                ##
                mask = range(11, 19, 1)
            elif iword >= 2 and iword != (len(module0) - 1):
                ##
                ## As we are not performing cluster-level data comparison/check,
                ## allow these non-header/footer-containing data words to
                ## pass the inspection
                ##
                pass_through = True
            else:
                ##
                ## Find the indices of the footer word.
                ## Even though the footer is guaranteed to be within the last
                ## dataword of a set of (well-formatted) module data, its
                ## starting position and length are not fixed.
                ## For pixel (strip) the footer has length 32 (16) bits, and it
                ## can be aligned at any Nth position (where N is aligned with the
                ## cluster data width.
                ##
                footer_idx = module_footer_start_idx(module_word0)
                if footer_idx >= 0:
                    # mask the bits NOT corresponding to the footer data
                    mask = range(0, footer_idx, 1)

            description = ""
            if iword < 2:
                module_header_diff_strings, bad_fields = meta_field_diff(
                    module0, module1, meta_type="module_header"
                )
                description = " ".join(module_header_diff_strings[iword])
                if iword == 0:
                    mod_num_str = Fore.RESET + f"MODULE #{imodule:03}"
                    description = f"{mod_num_str: <10} {description}"
            elif iword == len(module0) - 1:  # footer
                module_footer_diff_strings, bad_fields = meta_field_diff(
                    module0, module1, meta_type="module_footer"
                )
                description = " ".join(module_footer_diff_strings[0])
            module_word0, module_word1, diff = diff_data_words(
                module_word0, module_word1, pass_through=pass_through, mask=list(mask)
            )

            if verbose:
                diffprint(
                    module_word0,
                    module_word1,
                    diff,
                    indent=indent,
                    description=description,
                )

            if np.any(np.array(diff)):
                # We really shouldn't get here, since the ordered modules returned by "order_modules" are
                # matched based on equality!
                all_ok = False

    ##
    ## Inspect/compare the unmatched module data.
    ## Unmatched modules are those that are fully built modules (i.e.
    ## contain HEADER+CLUSTER_DATA[]+FOOTER, but only appear in one
    ## of the events to be compared. That is, the module only appears
    ## in event0 or event1.
    ##
    n_unmatched_0, n_unmatched_1 = len(unmatched_modules_0), len(unmatched_modules_1)
    any_unmatched = (n_unmatched_0 + n_unmatched_1) > 0
    if any_unmatched:
        event_test_results["module_data"] = [
            False,
            {"n_unmatched_0": n_unmatched_0, "n_unmatched_1": n_unmatched_1},
        ]

    for iunmatched, unmatched_modules in enumerate(
        [unmatched_modules_0, unmatched_modules_1]
    ):
        for imodule, module in enumerate(unmatched_modules):

            # if we get here, there are obviously issues
            all_ok = False

            if verbose:
                print(f"{indent} {'':-^40}")

            for iword in range(len(module)):
                module_word = module.data_words[iword]
                description = ""

                if iword < 2:
                    module_header_diff_strings, bad_fields = meta_field_diff(
                        module, module, meta_type="module_header"
                    )
                    description = " ".join(module_header_diff_strings[iword])
                    if iword == 0:
                        mod_str = (
                            Fore.RED
                            + f"MODULE #{iunmatched:03}/{imodule:03}"
                            + Fore.RESET
                        )
                        description = f"{mod_str: <10} {description}"

                elif iword == len(module) - 1:
                    # this is assumed to contain the footer
                    module_footer_diff_strings, bad_fields = meta_field_diff(
                        module, module, meta_type="module_footer"
                    )
                    description = " ".join(module_footer_diff_strings[0])
                    description = (
                        Fore.GREEN
                        + f"(FOOTER={hex(module.footer.value)})"
                        + Fore.RESET
                        + f" {description}"
                    )

                if iword >= 1 and len(module) == 2:
                    module_footer_diff_strings, bad_fields = meta_field_diff(
                        module, module, meta_type="module_footer"
                    )
                    description = " ".join(module_footer_diff_strings[0])
                    description = (
                        Fore.GREEN
                        + f"(FOOTER={hex(module.footer.value)})"
                        + Fore.RESET
                        + f" {description}"
                    )
                    description = (
                        Fore.RED + "SHORTMODULEWARN" + Fore.RESET + f" {description}"
                    )

                word_fmt = {
                    0: Fore.RED
                    + f"{str(module_word): <20} {'nomatch': ^20}"
                    + Fore.RESET,
                    1: Fore.RED
                    + f"{'nomatch': ^20} {str(module_word): <20}"
                    + Fore.RESET,
                }[iunmatched]

                if verbose:
                    if not description:
                        print(f"{indent} {word_fmt}")
                    else:
                        print(f"{indent} {word_fmt} {description}")

    ##
    ## Here we inspect/print those module data that were not able to be
    ## associated with _any_ module in either of the events. For example, if a module
    ## header/footer boundary is not observed then the associated data
    ## words will be "floating" and not a part of any of the built module
    ## objects considered in the above checks (those returned by get_modules()).
    ##
    unused_module_data_0, unused_module_data_1 = (
        event0.unmatched_data_words(),
        event1.unmatched_data_words(),
    )
    has_unused = len(unused_module_data_0) or len(unused_module_data_1)
    if has_unused:
        all_ok = False
        n_unused_0, n_unused_1 = 0, 0
        for iunused, unused_data_words in enumerate(
            [unused_module_data_0, unused_module_data_1]
        ):
            print(f"{indent} {'':-^40}")
            for iword, word in enumerate(unused_data_words):
                word_fmt = {
                    0: Fore.BLUE + f"{str(word): <20} {' ': ^20}" + Fore.RESET,
                    1: Fore.BLUE + f"{' ': ^20} {str(word): <20}" + Fore.RESET,
                }[iunused]
                description = Fore.BLUE + "headless" + Fore.RESET
                print(f"{indent} {word_fmt} {description}")
                if iunused == 0:
                    n_unused_0 += 1
                else:
                    n_unused_1 += 1
        event_test_results["floating_data"] = [
            False,
            {"n_floating_0": n_unused_0, "n_floating_1": n_unused_1},
        ]

    ###########################################################################
    ###########################################################################
    ##
    ## Compare/check the event footers
    ##
    ###########################################################################
    ###########################################################################
    footer_data_0, footer_data_1 = event0.footer_words, event1.footer_words

    if verbose:
        print(f"{indent} {'':-^40}")

    if len(footer_data_0) != len(footer_data_1):
        raise Exception("ERROR Malformed footers")

    footer_length = len(footer_data_0)
    for i in range(footer_length):
        f0 = footer_data_0[i]
        f1 = footer_data_1[i]
        f0, f1, diff = diff_data_words(f0, f1)
        footer_diff_strings, bad_fields = meta_field_diff(
            event0, event1, meta_type="event_footer"
        )
        description = " ".join(footer_diff_strings[i])

        if bad_fields:
            event_test_results["event_footer"] = [False, {"bad_fields": bad_fields}]

        if verbose:
            diffprint(f0, f1, diff, indent=indent, description=description)

        if np.any(np.array(diff)):
            all_ok = False
            if not bad_fields:
                raise Exception(
                    "ERROR We have event footer dataword differences but no registered bad fields!"
                )

    if verbose:
        print(f"{indent} {'':-^40}")

    return all_ok, event_test_results


def events_are_equal(events0, events1, verbose=False):
    """
    Compares the two lists of loaded events, "events0" and "events1",
    to each other.

    inputs:
        events0 -> list(tb_utils.events.DataEvent) : List of events from first file
        events1 -> list(tb_utils.events.DataEvent) : List of events from second file
        verbose -> bool : Flag for whether or not to print output

    returns:
        -> bool: True if events0 and events1 are found to be the same, False if not
    """

    all_ok = True
    global_test_results = {
        "n_events": [True, None],
        "recvd_l0ids": [True, None],
        "event_order": [True, None],
    }

    ###########################################################################
    ###########################################################################
    ##
    ## Compare/check the number of events in the input event lists
    ##
    ###########################################################################
    ###########################################################################
    print("SAIRAM: tb_diff events0 =",events0," #######\nevents1=",events1)
    n_events_0, n_events_1 = len(events0), len(events1)
    global_test_results["n_events"] = [
        n_events_0 == n_events_1,
        {"n_events_0": n_events_0, "n_events_1": n_events_1},
    ]
    if n_events_0 != n_events_1:
        all_ok = False
        if verbose:
            print("Number of events differ")


    ##
    ## summarize global test results
    ##
    global_test_results    = {"TEST_RESULT": all_ok, "RESULTS": global_test_results}
    all_event_test_results = {"TEST_RESULT": all_ok, "RESULTS": global_test_results}

    ##
    ## We should not need to handle (here) the case of "floating" events (those
    ## events that appear in one of the input events list but not the other)
    ## since we report the difference in L0IDs above and there is no need
    ## to fully parse these types of events
    ##

    ###########################################################################
    ###########################################################################
    ##
    ## Summarize the final results (TODO: enforce json schema)
    ##
    ###########################################################################
    ###########################################################################

    final_results = {"global": global_test_results, "event": all_event_test_results}

    return all_ok, final_results


def compare_files(
    filename0,
    filename1,
    requested_l0id=-1,
    endian="little",
    n_events=-1,
    verbose=False,
    tabulate=(False, False),
):
    """
    Loads events from the two input files "filename0" and "filename1".
    Passes the loaded events to comparison function(s).

    inputs:
        filename0 -> str: path to first file of events
        filename1 -> str: path to second file of events
        verbose -> bool : whether or not to print output

    returns:
        evetns_equal -> bool: True if all loaded events are equal, False if not
    """

    if verbose:
        print(80 * "=")
        print(f"File0: {filename0}")
        print(f"File1: {filename1}")

    l0id_request = -1
    if requested_l0id >= 0:
        l0id_request = requested_l0id
    events0 = events.load_events_from_file(
        filename0, endian=endian, n_to_load=n_events, l0id_request=l0id_request
    )
    events1 = events.load_events_from_file(
        filename1, endian=endian, n_to_load=n_events, l0id_request=l0id_request
    )

    events_equal, results_dict = events_are_equal(events0, events1, verbose=verbose)

    result_summary = result_handler.result_summary_dict(
        os.path.abspath(filename0),
        os.path.abspath(filename1),
        test_name="tb_diff",
        test_results=results_dict,
    )
    # results = json.dumps(result_summary, indent = 4, sort_keys = False)
    dump_table, table_event_detail = tabulate
    if dump_table:
        result_handler.dump_test_results(
            [result_summary], event_detail=table_event_detail, full_detail=True
        )
    return events_equal, result_summary


def my_events_are_equal(rx_events, exp_events, verbose=False):
    event_test_results = {
        "total_events":0,
        "total_passed":0,
        "total_failed":0,
    }
    event_test_results["total_events"] = len(exp_events)

    if(len(rx_events) != len(exp_events)):
        print("Number of Received Events (%d) does not match Expected (%d)" %(len(rx_events),len(exp_events)))
        event_test_results["total_failed"] += event_test_results["total_failed"]
        all_ok = False
    else:
        for i in range(len(rx_events)):
            if(rx_events[i] != exp_events[i]):
                print("%d Failed: Expected = 0x%x, Received = 0x%x" %(i, exp_events[i], rx_events[i]))
                event_test_results["total_failed"] += event_test_results["total_failed"]
                all_ok = False
            else:
                print("%d Passed: Expected = 0x%x, Received = 0x%x" %(i, exp_events[i], rx_events[i]))
                event_test_results["total_passed"] += event_test_results["total_passed"]
                all_ok = True

    #global_test_results = {"TEST_RESULT": all_ok, "RESULTS": global_test_results}
    #final_results = {"global":global_test_results, "event":event_test_results}
    return all_ok, event_test_results
