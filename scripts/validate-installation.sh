#!/bin/bash

# Cocos Creator Claude Agents Installation Validator
# This script validates that all agents are properly installed and accessible

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Constants
EXPECTED_AGENT_COUNT=29
CLAUDE_AGENTS_DIR="$HOME/.claude/the1-cocos-claude-agent"

echo -e "${BLUE}🔍 Cocos Creator Claude Agents Installation Validator${NC}"
echo "=================================================="

# Check if Claude Code CLI is installed
echo -n "Checking Claude Code CLI installation... "
if command -v claude &> /dev/null; then
    echo -e "${GREEN}✓ Found${NC}"
else
    echo -e "${RED}✗ Not found${NC}"
    echo -e "${RED}Error: Claude Code CLI is not installed or not in PATH${NC}"
    echo "Please install Claude Code CLI first: https://claude.ai/code"
    exit 1
fi

# Check Claude authentication
echo -n "Checking Claude authentication... "
if claude --version &> /dev/null; then
    echo -e "${GREEN}✓ Authenticated${NC}"
else
    echo -e "${RED}✗ Not authenticated${NC}"
    echo -e "${RED}Error: Please authenticate with Claude Code CLI first${NC}"
    echo "Run: claude auth"
    exit 1
fi

# Check if agents directory exists
echo -n "Checking agents directory... "
if [ -d "$CLAUDE_AGENTS_DIR" ]; then
    echo -e "${GREEN}✓ Found at $CLAUDE_AGENTS_DIR${NC}"
else
    echo -e "${RED}✗ Not found${NC}"
    echo -e "${RED}Error: Agents directory not found at $CLAUDE_AGENTS_DIR${NC}"
    echo "Please ensure you've installed the agents correctly."
    exit 1
fi

# Count agent files
echo -n "Counting agent files... "
AGENT_COUNT=$(find "$CLAUDE_AGENTS_DIR/agents" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
if [ "$AGENT_COUNT" -eq $EXPECTED_AGENT_COUNT ]; then
    echo -e "${GREEN}✓ Found $AGENT_COUNT/$EXPECTED_AGENT_COUNT agents${NC}"
else
    echo -e "${YELLOW}⚠ Found $AGENT_COUNT/$EXPECTED_AGENT_COUNT agents${NC}"
    echo -e "${YELLOW}Warning: Expected $EXPECTED_AGENT_COUNT agents but found $AGENT_COUNT${NC}"
fi

# List all agents by category
echo -e "\n${BLUE}📋 Installed Agents by Category:${NC}"

# Core Agents
echo -e "\n${BLUE}🏗️  Core Agents:${NC}"
CORE_AGENTS=(
    "cocos-scene-analyzer"
    "cocos-component-architect" 
    "cocos-asset-manager"
    "cocos-typescript-expert"
    "cocos-animation-specialist"
)

for agent in "${CORE_AGENTS[@]}"; do
    if [ -f "$CLAUDE_AGENTS_DIR/agents/core/$agent.md" ]; then
        echo -e "  ${GREEN}✓${NC} $agent"
    else
        echo -e "  ${RED}✗${NC} $agent"
    fi
done

# Orchestrators
echo -e "\n${BLUE}🎯 Orchestrators:${NC}"
ORCHESTRATOR_AGENTS=(
    "cocos-project-architect"
    "cocos-team-coordinator"
)

for agent in "${ORCHESTRATOR_AGENTS[@]}"; do
    if [ -f "$CLAUDE_AGENTS_DIR/agents/orchestrators/$agent.md" ]; then
        echo -e "  ${GREEN}✓${NC} $agent"
    else
        echo -e "  ${RED}✗${NC} $agent"
    fi
done

# Gameplay Specialists
echo -e "\n${BLUE}🎮 Gameplay Specialists:${NC}"
GAMEPLAY_AGENTS=(
    "cocos-casual-game-expert"
    "cocos-puzzle-game-expert"
    "cocos-2d-gameplay-expert"
    "cocos-3d-gameplay-expert"
    "cocos-level-designer"
    "cocos-progression-specialist"
)

for agent in "${GAMEPLAY_AGENTS[@]}"; do
    FOUND=false
    for dir in "gameplay" "2d" "3d"; do
        if [ -f "$CLAUDE_AGENTS_DIR/agents/specialized/$dir/$agent.md" ]; then
            echo -e "  ${GREEN}✓${NC} $agent"
            FOUND=true
            break
        fi
    done
    if [ "$FOUND" = false ]; then
        echo -e "  ${RED}✗${NC} $agent"
    fi
done

# UI/UX Agents
echo -e "\n${BLUE}🎨 UI/UX Agents:${NC}"
UI_AGENTS=(
    "cocos-ui-builder"
    "cocos-ux-designer"
)

for agent in "${UI_AGENTS[@]}"; do
    if [ -f "$CLAUDE_AGENTS_DIR/agents/specialized/ui/$agent.md" ]; then
        echo -e "  ${GREEN}✓${NC} $agent"
    else
        echo -e "  ${RED}✗${NC} $agent"
    fi
done

# Networking & Multiplayer
echo -e "\n${BLUE}🌐 Networking & Multiplayer:${NC}"
NETWORK_AGENTS=(
    "cocos-multiplayer-architect"
    "cocos-backend-integrator"
)

for agent in "${NETWORK_AGENTS[@]}"; do
    if [ -f "$CLAUDE_AGENTS_DIR/agents/specialized/networking/$agent.md" ]; then
        echo -e "  ${GREEN}✓${NC} $agent"
    else
        echo -e "  ${RED}✗${NC} $agent"
    fi
done

# Playable Ads
echo -e "\n${BLUE}📱 Playable Ads:${NC}"
PLAYABLE_AGENTS=(
    "cocos-playable-architect"
    "cocos-playable-optimizer"
    "cocos-tutorial-designer"
    "cocos-conversion-optimizer"
    "cocos-rapid-prototyper"
)

for agent in "${PLAYABLE_AGENTS[@]}"; do
    if [ -f "$CLAUDE_AGENTS_DIR/agents/specialized/playable-ads/$agent.md" ]; then
        echo -e "  ${GREEN}✓${NC} $agent"
    else
        echo -e "  ${RED}✗${NC} $agent"
    fi
done

# Performance & Optimization
echo -e "\n${BLUE}⚡ Performance & Optimization:${NC}"
PERFORMANCE_AGENTS=(
    "cocos-performance-optimizer"
    "cocos-mobile-optimizer"
)

for agent in "${PERFORMANCE_AGENTS[@]}"; do
    if [ -f "$CLAUDE_AGENTS_DIR/agents/performance/$agent.md" ]; then
        echo -e "  ${GREEN}✓${NC} $agent"
    else
        echo -e "  ${RED}✗${NC} $agent"
    fi
done

# Security & Deployment
echo -e "\n${BLUE}🔒 Security & Deployment:${NC}"
SECURITY_AGENTS=(
    "cocos-security-expert"
    "cocos-platform-integrator"
    "cocos-build-engineer"
)

for agent in "${SECURITY_AGENTS[@]}"; do
    FOUND=false
    for dir in "security" "build-deploy"; do
        if [ -f "$CLAUDE_AGENTS_DIR/agents/specialized/$dir/$agent.md" ] || [ -f "$CLAUDE_AGENTS_DIR/agents/$dir/$agent.md" ]; then
            echo -e "  ${GREEN}✓${NC} $agent"
            FOUND=true
            break
        fi
    done
    if [ "$FOUND" = false ]; then
        echo -e "  ${RED}✗${NC} $agent"
    fi
done

# Analytics & Intelligence
echo -e "\n${BLUE}📊 Analytics & Intelligence:${NC}"
ANALYTICS_AGENTS=(
    "cocos-analytics-specialist"
    "cocos-ai-specialist"
)

for agent in "${ANALYTICS_AGENTS[@]}"; do
    FOUND=false
    for dir in "analytics" "ai-ml"; do
        if [ -f "$CLAUDE_AGENTS_DIR/agents/specialized/$dir/$agent.md" ]; then
            echo -e "  ${GREEN}✓${NC} $agent"
            FOUND=true
            break
        fi
    done
    if [ "$FOUND" = false ]; then
        echo -e "  ${RED}✗${NC} $agent"
    fi
done

# Test Claude agent recognition
echo -e "\n${BLUE}🧪 Testing Claude Agent Recognition:${NC}"
echo -n "Testing agent list command... "

# Create temporary test to see if Claude recognizes agents
AGENT_LIST_OUTPUT=$(claude /agents 2>&1 || echo "ERROR")

if echo "$AGENT_LIST_OUTPUT" | grep -q "cocos-"; then
    echo -e "${GREEN}✓ Claude recognizes Cocos agents${NC}"
    COCOS_AGENT_COUNT=$(echo "$AGENT_LIST_OUTPUT" | grep -c "cocos-" || echo "0")
    echo "  Found $COCOS_AGENT_COUNT Cocos agents in Claude's registry"
else
    echo -e "${YELLOW}⚠ Claude may not recognize agents yet${NC}"
    echo "  This could be normal if agents were just installed"
    echo "  Try restarting your terminal or running 'claude refresh'"
fi

# Check CLAUDE.md file
echo -e "\n${BLUE}📄 Configuration Files:${NC}"
echo -n "Checking CLAUDE.md... "
if [ -f "$CLAUDE_AGENTS_DIR/CLAUDE.md" ]; then
    echo -e "${GREEN}✓ Found${NC}"
else
    echo -e "${YELLOW}⚠ Not found${NC}"
fi

echo -n "Checking README.md... "
if [ -f "$CLAUDE_AGENTS_DIR/README.md" ]; then
    echo -e "${GREEN}✓ Found${NC}"
else
    echo -e "${RED}✗ Not found${NC}"
fi

# Final summary
echo -e "\n${BLUE}📊 Installation Summary:${NC}"
echo "================================"

if [ "$AGENT_COUNT" -eq $EXPECTED_AGENT_COUNT ]; then
    echo -e "${GREEN}✅ Installation Complete${NC}"
    echo "All $EXPECTED_AGENT_COUNT Cocos Creator agents are installed and ready to use!"
    echo ""
    echo -e "${BLUE}🚀 Next Steps:${NC}"
    echo "1. Navigate to your Cocos Creator project directory"
    echo "2. Run: claude \"use @cocos-team-coordinator and set up the optimal AI team for my Cocos Creator project\""
    echo "3. Start building with specialized agents!"
    echo ""
    echo -e "${BLUE}💡 Quick Usage Examples:${NC}"
    echo "• claude \"use @cocos-playable-architect and create a match-3 playable ad\""
    echo "• claude \"use @cocos-performance-optimizer and improve my game's performance\""
    echo "• claude \"use @cocos-ui-builder and create responsive UI for mobile\""
elif [ "$AGENT_COUNT" -gt 0 ]; then
    echo -e "${YELLOW}⚠️  Partial Installation${NC}"
    echo "Found $AGENT_COUNT out of $EXPECTED_AGENT_COUNT expected agents."
    echo "Some agents may be missing. Consider reinstalling."
else
    echo -e "${RED}❌ Installation Failed${NC}"
    echo "No agents found. Please check the installation process."
    exit 1
fi

echo ""
echo -e "${BLUE}📖 Documentation:${NC}"
echo "• Full documentation: https://github.com/The1Studio/the1-cocos-claude-agent"
echo "• Best practices: docs/best-practices.md"
echo "• Agent reference: Browse the agents/ directory"

exit 0