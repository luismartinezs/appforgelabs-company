Each task is a Markdown file. Invoke with:
claude -p "Use the <agent>  subagent to handle task ./tasks/<file>.md"

Task template:
# Task: <short title>
## Context
<what this is about, links>
## Deliverable
<exact artifact expected> (e.g., one-page plan at docs/..., or script at ops/...)
## Done when
<binary completion criteria>
## Constraints
<time/cost/scope limits, if any>

Example of task invocation: `claude -p "The atlas-ceo subagent should handle task ./tasks/ceo-sample.md" >> logs/conversation.md 2>&1`