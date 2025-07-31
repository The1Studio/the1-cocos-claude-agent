# Cocos Creator Claude Agents

A comprehensive collection of specialized Claude agents for Cocos Creator game development. These agents are designed to assist with various aspects of game development in Cocos Creator 3.8.x, from architecture design to performance optimization.

## Overview

This repository contains AI agent configurations optimized for Cocos Creator development. Each agent specializes in specific aspects of game development, allowing for efficient and expert assistance across the entire development lifecycle.

## Agent Categories

### 🏗️ Core Agents
Essential agents for any Cocos Creator project:
- **cocos-scene-analyzer** - Analyzes scene structure and node hierarchies
- **cocos-component-architect** - Designs and implements component systems
- **cocos-asset-manager** - Manages resources and asset bundles
- **cocos-typescript-expert** - TypeScript patterns and best practices
- **cocos-animation-specialist** - Animation systems and effects

### 🎯 Orchestrators
High-level agents that coordinate other agents:
- **cocos-project-architect** - Overall project architecture and planning
- **cocos-team-coordinator** - Configures AI team for specific projects

### 🎮 Gameplay Specialists
Genre-specific agents:
- **cocos-casual-game-expert** - Hyper-casual and casual games
- **cocos-puzzle-game-expert** - Match-3 and puzzle mechanics
- **cocos-2d-gameplay-expert** - 2D physics and mechanics
- **cocos-3d-gameplay-expert** - 3D gameplay systems

### 🎨 UI/UX Agents
- **cocos-ui-builder** - Responsive UI implementation
- **cocos-ux-designer** - User experience optimization

### 🌐 Networking & Multiplayer
- **cocos-multiplayer-architect** - Real-time multiplayer systems
- **cocos-backend-integrator** - Server integration

### 📱 Playable Ads (NEW!)
- **cocos-playable-architect** - Playable ad structure and design
- **cocos-playable-optimizer** - Size optimization for ad networks
- **cocos-tutorial-designer** - Engaging tutorial flows
- **cocos-conversion-optimizer** - Maximize install rates
- **cocos-rapid-prototyper** - Quick prototype development

### ⚡ Performance & Optimization
- **cocos-performance-optimizer** - General performance tuning
- **cocos-mobile-optimizer** - Mobile-specific optimization

## 🚀 Quick Start (3 Minutes)

### Prerequisites
- **Claude Code CLI** installed and authenticated
- **Claude subscription** - recommended for intensive agent workflows
- Active Cocos Creator project directory

### 1. Install the Agents
```bash
git clone https://github.com/The1Studio/the1-cocos-claude-agent.git
```

#### Option A: Symlink (Recommended - auto-updates)

**macOS/Linux:**
```bash
ln -sf "$(pwd)/the1-cocos-claude-agent" ~/.claude/the1-cocos-claude-agent
```

**Windows (PowerShell):**
```powershell
cmd /c mklink /D "$env:USERPROFILE\.claude\the1-cocos-claude-agent" "$(Get-Location)\the1-cocos-claude-agent"
```

#### Option B: Copy (Static - no auto-updates)
```bash
cp -r the1-cocos-claude-agent ~/.claude/
```

### 2. Verify Installation
```bash
claude /agents
# Should show all 21 Cocos Creator agents
```

### 3. Initialize Your Cocos Project
**Navigate** to your **Cocos Creator project directory** and run:

```bash
claude "use @cocos-team-coordinator and set up the optimal AI team for my Cocos Creator project"
```

### 4. Start Building
```bash
# For playable ads
claude "use @cocos-playable-architect and create a match-3 playable ad structure"

# For mobile games
claude "use @cocos-project-architect and design a casual puzzle game architecture"

# For optimization
claude "use @cocos-performance-optimizer and improve my game's performance"
```

Your AI team will automatically detect your Cocos version and select the right specialists!

## 🎯 How It Works

The Cocos Creator agents work together seamlessly:

1. **Project Analysis** - `cocos-team-coordinator` detects your Cocos version, project type, and target platforms
2. **Architecture Planning** - `cocos-project-architect` designs the overall system structure  
3. **Specialized Implementation** - Domain experts handle specific areas (playable ads, UI, performance)
4. **Quality Assurance** - Built-in optimization and best practices enforcement

### Example Workflows

**Creating a Playable Ad:**
```bash
claude "use @cocos-rapid-prototyper and create a quick match-3 playable prototype"
claude "use @cocos-tutorial-designer and add an engaging tutorial flow"  
claude "use @cocos-playable-optimizer and reduce size to under 3MB"
claude "use @cocos-conversion-optimizer and maximize install rates"
```

**Building a Mobile Game:**
```bash
claude "use @cocos-casual-game-expert and implement core gameplay mechanics"
claude "use @cocos-ui-builder and create responsive UI for multiple screen sizes"
claude "use @cocos-mobile-optimizer and optimize for low-end Android devices"
```

## 🔥 Why Specialized Agents Beat Generic AI

- **Cocos Creator Expertise**: Each agent masters specific aspects of Cocos Creator 3.8.x development
- **Playable Ads Focus**: Specialized knowledge for your core business - size limits, conversion optimization, tutorial design
- **Real Collaboration**: Agents coordinate seamlessly, sharing context and following delegation patterns
- **Industry Best Practices**: Get code that follows Cocos Creator conventions and mobile game standards
- **Rapid Development**: Template-based workflows for quick playable ad production

## 📈 The Impact for Your Business

- **Ship Playables Faster** - Complete prototypes in hours, not days
- **Higher Conversion Rates** - Psychology-driven tutorial and CTA optimization  
- **Consistent Quality** - Every playable follows size limits and performance standards
- **Scale Production** - Template system enables batch creation of variations
- **Reduce Iteration Time** - Quick A/B testing and optimization cycles

## 🎮 Perfect for Playable Ads Business

Our agents are specifically designed for companies creating playable ads:

- **Size Optimization** - Meet strict network requirements (2-5MB)
- **Conversion Focus** - Maximize install rates with proven strategies
- **Rapid Prototyping** - Quick iteration for client approval cycles
- **Template System** - Reusable patterns for similar playables
- **Network Compliance** - Facebook, Google, Unity, IronSource specifications

## Best Practices

1. **Start with Orchestrators**: Use `cocos-project-architect` for new projects
2. **Layer Specialists**: Combine multiple agents for complex tasks
3. **Platform-Specific**: Use mobile optimizers when targeting phones/tablets
4. **Performance First**: Always consider performance implications

## Agent Selection Guide

### By Project Type

**Casual Mobile Game**
- cocos-project-architect
- cocos-casual-game-expert
- cocos-mobile-optimizer
- cocos-ui-builder

**Puzzle Game**
- cocos-project-architect
- cocos-puzzle-game-expert
- cocos-level-designer
- cocos-progression-specialist

**Multiplayer Game**
- cocos-project-architect
- cocos-multiplayer-architect
- cocos-backend-integrator
- cocos-security-expert

**Playable Ads**
- cocos-playable-architect
- cocos-rapid-prototyper
- cocos-tutorial-designer
- cocos-conversion-optimizer
- cocos-playable-optimizer

### By Development Phase

**Planning & Architecture**
- cocos-project-architect
- cocos-team-coordinator

**Implementation**
- cocos-component-architect
- Genre-specific experts
- cocos-ui-builder

**Optimization**
- cocos-performance-optimizer
- cocos-mobile-optimizer

**Deployment**
- cocos-build-engineer
- cocos-platform-integrator

## Cocos Creator Version Support

These agents are optimized for Cocos Creator 3.8.x but include patterns that work with:
- Cocos Creator 3.x
- Cocos Creator 2.x (with modifications)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding new agents or improving existing ones.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📚 Learn More

- [Best Practices Guide](docs/best-practices.md) - Get the most from your Cocos Creator AI team
- [Contributing Guide](CONTRIBUTING.md) - Add your own specialized agents
- [Cocos Creator Documentation](https://docs.cocos.com/creator/manual/en/)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)

## 💬 Join The Community

- ⭐ **Star this repo** to show support for Cocos Creator development
- 🐛 [Report issues](https://github.com/The1Studio/the1-cocos-claude-agent/issues) - Help us improve the agents
- 💡 [Request features](https://github.com/The1Studio/the1-cocos-claude-agent/issues) - Suggest new agents or improvements
- 🎉 Share your playable ads built with these agents!

## 🏢 About The1Studio

Built by [The1Studio](https://github.com/The1Studio) - specialists in mobile game development and playable advertising.

## Acknowledgments

Inspired by the [awesome-claude-agents](https://github.com/vijaythecoder/awesome-claude-agents) project. Adapted specifically for Cocos Creator and playable ads development.

---

<p align="center">
  <strong>Transform Claude Code into a Cocos Creator development team that ships playable ads</strong><br>
  <em>Specialized agents. Rapid prototyping. Maximum conversions.</em>
</p>

<p align="center">
  <a href="https://github.com/The1Studio/the1-cocos-claude-agent">GitHub</a> •
  <a href="docs/best-practices.md">Documentation</a> •
  <a href="https://github.com/The1Studio/the1-cocos-claude-agent/issues">Community</a>
</p>