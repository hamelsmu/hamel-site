#!/Users/hamel/opt/anaconda3/bin/python
from typing import Text
from panflute import *
from logging import warning


def increase_header_level(elem, doc):
    if type(elem) == CodeBlock and type(elem.parent.prev) == CodeBlock:
        return ([RawBlock("<CodeOutput>"), elem, RawBlock("</CodeOutput>")])
    elif type(elem) == CodeBlock:
        elem.classes = ['file=script.py']


def main(doc=None):
    return run_filter(increase_header_level, doc=doc)


if __name__ == "__main__":
    main()
