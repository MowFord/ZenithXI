#!/bin/bash

any_issues=false

if [[ $# -gt 0 ]]; then
    targets=("$@")
else
    mapfile -t targets < <(find sql modules -name '*.sql')
fi

for file in "${targets[@]}"; do
    [[ -f $file && ($file == sql/*.sql || $file == modules/**/*.sql) ]] || continue

    # Run tools and capture output
    bogus_comments=$(grep -En '(--\w)|^(---\s)' "$file" 2>&1 || true)
    # TODO lint files in top-level sql folder using the same mechanisms as dbtool's function: update_sql_from_db
    if [[ $file == modules/**/*.sql ]]; then
        sql_lint=$(sqlfluff lint --config tools/ci/sanity_checks/sqlfluff.ini "$file" 2>&1)
        sql_lint_exitcode=$?
    else
        sql_lint_exitcode=0
    fi

    # Check if there were issues
    if [[ -n "$bogus_comments" || $sql_lint_exitcode -ne 0 ]]; then
        if ! $any_issues; then
            echo "## :x: SQL Checks Failed"
            any_issues=true
        fi

        if [[ -n "$bogus_comments" ]]; then
            echo "#### Bogus comments:"
            echo "> $file"
            echo '```'
            echo "$bogus_comments"
            echo '```'
            echo
        fi

        if [[ $sql_lint_exitcode -ne 0 ]]; then
            echo "#### SQL Lint:"
            # sqlfluff includes the filename in the header of the output
            echo '```'
            echo "$sql_lint"
            echo '```'
            echo
        fi
    fi
done

# If no section was written, emit a success summary
if ! $any_issues; then
    echo "## :heavy_check_mark: SQL Checks Passed"
    echo
fi

$any_issues && exit 1 || exit 0
