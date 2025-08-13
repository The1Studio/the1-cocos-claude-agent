# Creating Cocos Creator Claude Agents

Learn how to create powerful, specialized Claude sub-agents for Cocos Creator game development.

## Quick Start

```yaml
---
name: your-cocos-agent-name
description: |
  One-line description of Cocos Creator expertise.
  
  Examples:
  - <example>
    Context: When this agent should be used for Cocos Creator tasks
    user: "Example user request for Cocos functionality"
    assistant: "I'll use the your-cocos-agent-name to..."
    <commentary>
    Why this agent was selected for this Cocos Creator task
    </commentary>
  </example>
tools: Read, Write, Edit, Bash  # Optional - inherits all if omitted
---

You are an expert Cocos Creator [role] specializing in [domain].

## Core Expertise
- [Specific Cocos Creator skill 1]
- [Specific Cocos Creator skill 2]

## Task Approach
1. [How you handle Cocos Creator tasks]
2. [Your Cocos Creator methodology]

## Return Format
Provide clear, structured output that other agents can understand.
```

## The XML-Style Pattern for Cocos Creator

Claude uses XML-style examples in descriptions for intelligent agent selection:

```yaml
description: |
  Expert Cocos Creator developer specializing in 2D gameplay mechanics.
  
  Examples:
  - <example>
    Context: User needs to implement 2D physics gameplay
    user: "Create a physics-based puzzle game in Cocos Creator"
    assistant: "I'll use @cocos-2d-gameplay-expert to implement the physics mechanics"
    <commentary>
    2D physics gameplay is a core specialty of this agent
    </commentary>
  </example>
  - <example>
    Context: User has completed 2D gameplay and needs optimization
    user: "The game is laggy on mobile devices"
    assistant: "The gameplay is complete. Let me hand this off to @cocos-mobile-optimizer"
    <commentary>
    Recognizing when to delegate to mobile optimization specialist
    </commentary>
  </example>
```

### Why This Works for Cocos Creator

1. **Pattern Learning**: Claude learns from examples when to invoke Cocos Creator agents
2. **Context Awareness**: Understands game development stage and Cocos Creator specifics
3. **Smart Delegation**: Knows when to hand off to other Cocos Creator specialists
4. **Self-Documenting**: Examples serve as live documentation for Cocos Creator workflows

## Cocos Creator Agent Integration

Agents work together through the main Claude agent coordination. Focus on:

- **Clear Output**: Provide structured results specific to Cocos Creator
- **Next Steps**: Suggest what should happen next in the game development process
- **Context Passing**: Include relevant Cocos Creator project information for follow-up work

## Tool Configuration

### Understanding Tool Inheritance

The `tools` field in the agent frontmatter is **optional**. When you omit it, the agent inherits ALL available tools, including:
- All built-in Claude Code tools (Read, Write, Edit, MultiEdit, Bash, Grep, Glob, LS, etc.)
- WebFetch for accessing Cocos Creator documentation and web resources
- Any MCP (Model Context Protocol) tools from connected servers

```yaml
---
name: my-cocos-agent
description: "My Cocos Creator agent description"
# No tools field = inherits everything!
---
```

### When to Specify Tools

Only specify tools when you want to **restrict** an agent's capabilities:

```yaml
---
name: cocos-code-reviewer
description: "Reviews Cocos Creator code without making changes"
tools: Read, Grep, Glob, Bash  # Read-only tools for safety
---
```

### Best Practices

1. **Most agents should omit the tools field** - This gives maximum flexibility
2. **Security-sensitive agents** - Explicitly list tools (e.g., reviewers get read-only)
3. **Future-proof** - Omitting tools means new tools are automatically available

## Essential Components for Cocos Creator Agents

### 1. Focused Cocos Creator Expertise
- Single Cocos Creator domain mastery
- Clear boundaries within game development
- Specific Cocos Creator use cases

### 2. Smart Cocos Creator Examples
- 2-3 examples covering different Cocos Creator scenarios
- Include edge cases specific to game development
- Show when NOT to use this agent in Cocos Creator context

### 3. Clear Cocos Creator Output
- Provide structured results for game development
- Identify next steps in the game development pipeline
- Include relevant Cocos Creator project context

## Testing Your Cocos Creator Agent

1. **Invocation Test**: Does it trigger on appropriate Cocos Creator requests?
2. **Output Test**: Does it provide clear, structured results for game development?
3. **Quality Test**: Is the output expert-level for Cocos Creator development?

## Common Cocos Creator Patterns

### Game Development Flow
```
@cocos-project-architect → Project Setup → @cocos-component-architect → Core Systems → @cocos-2d-gameplay-expert
```

### Playable Ad Development
```
@cocos-playable-architect → Design → @cocos-rapid-prototyper → Implementation → @cocos-conversion-optimizer
```

### Mobile Game Pipeline
```
@cocos-gameplay-programmer → Game Logic → @cocos-mobile-optimizer → Performance → @cocos-build-engineer
```

### Review and Quality Assurance
```
@cocos-typescript-expert → Code Complete → @cocos-code-reviewer → @cocos-qa-engineer
```

## Cocos Creator Specific Considerations

### Project Structure
- Understand Cocos Creator project hierarchy
- Work with assets, scenes, prefabs, and scripts
- Handle TypeScript and JavaScript code

### Mobile Optimization
- Consider mobile performance constraints
- Optimize for different screen sizes and orientations
- Handle touch input and mobile-specific features

### Playable Ads
- Understand size constraints and loading requirements
- Focus on quick engagement and conversion
- Handle HTML5 export optimizations

### Cross-Platform Development
- Consider platform-specific requirements
- Handle different input methods
- Optimize for various devices and performance levels

## Next Steps

- Browse existing Cocos Creator agents in [agents/](../agents/) for implementation examples
- Check [best-practices.md](best-practices.md) for Cocos Creator optimization tips
- Start with the agent YAML template shown above
- Test with real Cocos Creator projects to ensure effectiveness