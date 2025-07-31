# Contributing to Cocos Creator Claude Agents

Thank you for your interest in contributing to the Cocos Creator Claude Agents project! This guide will help you understand how to contribute effectively.

## How to Contribute

### Adding New Agents

1. **Identify the Need**
   - Check if a similar agent already exists
   - Ensure the agent serves a specific Cocos Creator development need
   - Consider if it should be a new agent or an enhancement to an existing one

2. **Agent Structure**
   ```markdown
   # Agent Name
   
   Brief description of the agent's purpose. MUST BE USED for [specific scenarios].
   
   ## Expertise
   - List of specific skills
   - Technologies and APIs
   - Domain knowledge
   
   ## Tools
   - List required tools (Read, Write, Grep, etc.)
   
   ## Usage Examples
   
   ### Example 1: [Scenario]
   ```
   Context: [Background]
   User: "[User request]"
   Assistant: "I'll use the [agent-name] to [action]"
   Commentary: [What the agent does]
   ```
   
   ## Delegations
   
   ### To [other-agent]
   Trigger: [When to delegate]
   Handoff: "[Message to pass]"
   ```

3. **Categories**
   - **Core**: Essential functionality for all projects
   - **Orchestrators**: High-level coordination agents
   - **Specialized**: Domain-specific agents
   - **Performance**: Optimization-focused agents
   - **Build/Deploy**: Build and deployment agents

### Improving Existing Agents

1. **Enhancements**
   - Add new expertise areas
   - Include additional code examples
   - Improve delegation patterns
   - Add platform-specific considerations

2. **Bug Fixes**
   - Correct inaccurate information
   - Update deprecated Cocos Creator APIs
   - Fix code examples

### Code Examples

When adding code examples:

1. **Use TypeScript** (Cocos Creator 3.x standard)
2. **Include decorators** and property definitions
3. **Follow Cocos naming conventions**
4. **Add comments for clarity**

Example:
```typescript
@ccclass('ExampleComponent')
export class ExampleComponent extends Component {
    @property(Label)
    label: Label = null;
    
    @property
    speed: number = 100;
    
    start() {
        // Initialization code
    }
    
    update(deltaTime: number) {
        // Frame update logic
    }
}
```

## Best Practices

### 1. Agent Naming
- Use prefix: `cocos-`
- Be specific: `cocos-puzzle-game-expert` not `cocos-game-expert`
- Use lowercase with hyphens

### 2. Documentation
- Clear, concise descriptions
- Real-world usage examples
- Specific trigger conditions
- Delegation patterns

### 3. Expertise Scope
- Keep agents focused on specific domains
- Avoid overly broad agents
- Ensure clear boundaries between agents

### 4. Version Compatibility
- Default to Cocos Creator 3.8.x
- Note version-specific features
- Include migration notes when relevant

## Testing Your Contribution

Before submitting:

1. **Validate Markdown** formatting
2. **Check code examples** compile (if applicable)
3. **Ensure consistency** with existing agents
4. **Test delegation patterns** make sense

## Submission Process

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-agent-name`
3. Add your agent file(s)
4. Update README.md if adding new categories
5. Commit with clear message: `Add cocos-[specific]-agent for [purpose]`
6. Push to your fork
7. Create a Pull Request

## Pull Request Guidelines

### Title
- "Add [agent-name] for [specific purpose]"
- "Improve [agent-name] with [enhancement]"
- "Fix [issue] in [agent-name]"

### Description
Include:
- Why this agent is needed
- What specific problems it solves
- Any dependencies on other agents
- Testing performed

### Review Criteria
- Follows agent structure template
- Serves a clear, specific need
- No significant overlap with existing agents
- Code examples are correct
- Documentation is clear and complete

## Community Guidelines

- Be respectful and constructive
- Focus on Cocos Creator best practices
- Share real-world experience
- Help improve others' contributions

## Questions?

If you have questions about contributing:
1. Check existing agents for examples
2. Open an issue for discussion
3. Ask in the PR comments

Thank you for helping make Cocos Creator development better with AI assistance!