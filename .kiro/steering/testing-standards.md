---
inclusion: always
---

# Testing Standards

## Test Organization

### Test Structure
- **MUST** follow Arrange-Act-Assert pattern (but don't add comments for each section)
- Keep test methods focused on a single behavior
- Use descriptive test method names that explain the scenario and expected outcome
- Format: `MethodName_Scenario_ExpectedBehavior`

## Unit Testing

### Test Data Setup
- Create minimal test data - only what's needed for the test
- Example:
  ```csharp
  const int EntityId = 123;
  const string Code = "ABC";
  var expectedEntity = new Entity { Id = EntityId, Name = "Test" };
  ```

### Test Naming
- Use descriptive names that explain the test scenario
- Include the method being tested, the scenario, and the expected result
- Examples:
  - `GetEntity_WithValidId_ReturnsEntity`
  - `GetEntity_WithMissingId_ReturnsNull`
  - `ProcessData_WithSpecialCase_HandlesCorrectly`

## Testing Frameworks

### NUnit
- Use `[Test]` attribute for test methods
- Use `[TestFixture]` attribute for test classes
- Use `[DomainData]` attribute for tests that need AutoFixture setup
- Use `Should()` assertions from AwesomeAssertions for fluent syntax

### NSubstitute
- Use `Substitute.For<T>()` to create mocks
- Use `.Returns()` to set up return values
- Use `.Received()` to verify method calls
- Example:
  ```csharp
  var service = Substitute.For<IDataService>();
  service.GetData(id).Returns(expectedData);
  service.Received(1).GetData(id);
  ```

## Test Coverage Strategy

### Unit Test Focus
- Test individual classes and methods in isolation
- Mock dependencies to focus on the unit under test
- Avoid testing implementation details of dependencies

### Integration Test Focus
- Test how components work together
- Verify end-to-end flows through multiple layers
- Use real implementations where practical

### Avoiding Test Duplication
- If a dependency has comprehensive unit tests, focus on orchestration, not re-testing the dependency's logic
- Consider refactoring if tests duplicate detailed logic already covered by dependency tests
- Tests should verify correct dependency usage and data flow

## Test Coverage Analysis

### Analyzing Existing Tests
- Before implementing new features, analyze existing test coverage
- Document findings in an analysis document (e.g., `analysis.md` in spec folder)
- Identify gaps in coverage: missing scenarios, edge cases
- Compare test patterns across similar components 

### Analysis Document Structure
- **Executive Summary**: High-level findings and coverage status
- **Current Test Coverage**: Breakdown by test type (unit, approval, integration)
- **Implementation Analysis**: Review of actual code being tested
- **What's Missing**: Specific gaps identified
- **Recommendations**: Actionable next steps
- **Test Infrastructure Notes**: Patterns and tools available

### Coverage Assessment
-  Explicit tests: Tests that directly assert on specific behavior
-  Implicit tests: Tests that capture behavior indirectly (e.g., approval tests)
-  No coverage: Functionality not tested at all

## Test Maintenance

### Test Readability
- Remove unnecessary comments (no `// Arrange`, `// Act`, `// Assert`)
- Prefer explicit assertions over generic ones
