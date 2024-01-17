class Writer(object):
    """docstring for Writer"""
    def __init__(self, chain, outputdir, sector, hemisphere, bec, block,
                 nevents):
        super(Writer, self).__init__()
        self.chain = chain
        self.outputdir = outputdir
        self.sector = sector
        self.hemisphere = hemisphere
        self.bec = bec
        self.nevents = nevents
        self.bec_str = "Barrel"
        if bec == 1:
            self.bec_str = "Endcap"
        self.block = block
        self.TDCRES = 0.03125
        # conversion factor from ns to tdc count
        self.NS_TO_TDC = 1.28
        ## Constant for latency
        # Sector Logic candidate arrival MDTTP
        self.SLC_TOA = 1675  # ns
        """
		Remap the charge label convention  
		"""
        self.CHARGE_REMAP = {
            -1: 0,
            1: 1,
        }
        # best estimate t0 before hit arrived TDC
        self.HIT_TOA = 542.5  #  ns
        # t0 in MC
        self.T0_MC = 817  #ns
        self.DICT_SLC = {'A': 0, 'C': 1}
        self.side = self.DICT_SLC[self.hemisphere]
