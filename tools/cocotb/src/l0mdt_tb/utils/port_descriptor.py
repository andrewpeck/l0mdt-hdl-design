import enum


class PortDescriptor:
    def __init__(self):
        print("called PortDescriptor constructor")
        self.config_inputs={}
        self.config_outputs={}
        pass

    class Inputs(enum.Enum):
        pass

    class Outputs(enum.Enum):
        pass

    @staticmethod
    def simplename(io_enum):
        return str(io_enum.name).replace("_", "")

    
