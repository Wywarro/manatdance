class Device:
    deviceIp = ""

    def __init__(self, **entries):
        self.__dict__.update(entries)