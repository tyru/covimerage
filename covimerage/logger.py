import logging
import sys

logger = logging.getLogger('covimerage')
logger.setLevel(logging.INFO)


class AlwaysStderrHandler(logging.StreamHandler):
    def __init__(self, level=logging.NOTSET):
        logging.Handler.__init__(self, level)

    @property
    def stream(self):
        return sys.stderr

    def handleError(self, record):
        super(AlwaysStderrHandler, self).handleError(record)
        raise Exception('Internal logging error')


logger.addHandler(AlwaysStderrHandler())
