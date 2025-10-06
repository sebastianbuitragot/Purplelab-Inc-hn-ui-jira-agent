## Jira Integration

When creating Jira sub-tasks using the MCP Atlassian tool, use the following JSON structure:

take into account additional context :

{{ $ARGUMENTS }}

```json
{
  "project_key": "SPA",
  "summary": "<Sub-task title>",
  "issue_type": "<Sub-task>",
  "description": "<Sub-task description>",
  "additional_fields": {
    "parent": "PARENT-KEY"
  }
}
```
