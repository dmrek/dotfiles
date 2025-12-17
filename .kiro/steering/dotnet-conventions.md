---
inclusion: always
---

# .NET Coding Conventions

## Naming Conventions

### Constants
- **MUST** use PascalCase for all constants (including local constants in test methods)
- Examples:
  - ✅ `const int UserId = 123;`
  - ✅ `const string ApiKey = "ABC123";`
  - ❌ `const int userId = 123;` (camelCase not allowed)

### Variables
- Use `var` for object instantiation and complex types
- Use `const` for compile-time constants (strings, numbers, booleans)
- Prefer `const` over `var` when the value is a literal constant

## Code Organization

### Interfaces and Implementations
- Prefer interfaces over concrete types in public APIs
- Use dependency injection for loose coupling

## Design Patterns

### Factory Pattern
- Use factory pattern for creating strategy-based implementations
- Factories should return interfaces, not concrete types