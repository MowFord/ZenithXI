"""Custom rules for LSB SQLFluff plugin.

Must be registered as python packages to be discoverable by sqlfluff
"""

from typing import List, Type

from sqlfluff.core.plugin import hookimpl
from sqlfluff.core.rules import BaseRule

@hookimpl
def get_rules() -> List[Type[BaseRule]]:
    from rules.multiline_statements_blank_line import Rule_LSB001

    return [Rule_LSB001]
