---
inclusion: always
---

# Spec-Driven Development

## Spec Workflow

### Document Review Process
- Always review completed work against the spec documents (requirements.md, design.md, tasks.md)
- Identify which tasks are complete vs. remaining
- Distinguish between required tasks and optional test tasks
- Update task status to reflect actual completion

### Task Planning
- Required tasks focus on core functionality
- Optional tasks (marked with `*`) provide additional quality assurance but aren't required for production
- When reviewing task lists, assess relevance of remaining tasks to actual implementation needs
- Consider whether logic is already covered by dependency tests before adding additional test coverage

### Implementation Approach
- Implement core functionality first
- Add unit tests for new/modified classes
- Add integration tests for end-to-end flows
- Optional: Add property-based tests and comprehensive edge case coverage

### Analysis Tasks
- First task in implementation plan should analyze existing coverage
- Create analysis document to inform subsequent tasks
- Analysis should cover:
  - Existing test files and their coverage
  - Implementation code being tested
  - Comparison with similar components
  - Test infrastructure and patterns available
  - Specific gaps and missing scenarios
- Use analysis findings to validate and refine remaining tasks

## Task List Maintenance

### Updating Tasks
- Mark completed tasks with `[x]`
- Add new required tasks when gaps are identified
- Clearly separate required vs. optional tasks
- Include specific class names in task descriptions for clarity
- Reference requirements that each task validates

### Task Descriptions
- Be specific about what needs to be tested
- List the classes/methods involved
- Include examples of test scenarios
- Reference related requirements from requirements.md
