try:
    FileNotFoundError = FileNotFoundError
except NameError:
    FileNotFoundError = IOError

try:
    from StringIO import StringIO
except ImportError:
    from io import StringIO  # noqa: F401
