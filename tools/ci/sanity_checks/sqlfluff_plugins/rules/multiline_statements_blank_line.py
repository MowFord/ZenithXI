"""Rule LSB001: Ensure blank line after multi-line statements."""

from sqlfluff.core.parser import NewlineSegment
from sqlfluff.core.rules import BaseRule, LintResult, LintFix, RuleContext
from sqlfluff.core.rules.crawlers import SegmentSeekerCrawler


class Rule_LSB001(BaseRule):
    """Ensure there is a blank line after multi-line SQL statements."""

    groups = ("all",)
    crawl_behaviour = SegmentSeekerCrawler({"statement"})
    is_fix_compatible = True

    def _eval(self, context: RuleContext):
        seg = context.segment
        if not seg or seg.type != "statement":
            return None

        raw = seg.raw.rstrip()
        # ignore statements that don't contain a newline
        if "\n" not in raw:
            return None

        # This is a multi-line statement, check the next segments to ensure we only have whitespace and comments before the first newline, which is then immediately followed by another newline
        following_segments = context.siblings_post
        last_segment = seg

        # Count newlines
        newline_found = False
        for seg in following_segments:
            isNewline = seg.is_type("newline") or seg.is_type("end_of_file")
            if newline_found:
                if not isNewline:
                    # non-newline found after first newline
                    newline_found = False

                break

            if isNewline:
                newline_found = True

            last_segment = seg

        # Need at least 2 newlines for a blank line
        if not newline_found:
            return LintResult(
                anchor=context.segment,
                description="Expected a blank line after multi-line statement.",
                fixes=[LintFix.create_after(last_segment, [NewlineSegment("\n")])]
            )

        return None
