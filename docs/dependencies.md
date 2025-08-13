# Dependencies

## Context7 MCP (Optional)

Some agents reference Context7 MCP for fetching up-to-date Cocos Creator documentation. While not required (agents will use WebFetch as fallback), Context7 provides better documentation access.

### Installation

1. Install Context7 MCP server:
```bash
npm install -g @context7/mcp-server
```

2. Configure in Claude's MCP settings:
```json
{
  "mcpServers": {
    "context7": {
      "command": "context7-mcp",
      "args": []
    }
  }
}
```

3. Restart Claude Code to activate

### Benefits
- Faster Cocos Creator documentation retrieval
- Better structured responses for game development
- Cached documentation access for offline work

Without Context7, agents automatically use WebFetch to fetch documentation from Cocos Creator official websites.

## Cocos Creator Specific Dependencies

### Required Tools
- **Cocos Creator**: Latest version recommended for compatibility
- **Node.js**: Required for TypeScript compilation and tooling
- **TypeScript**: For modern Cocos Creator development

### Optional Development Tools
- **Visual Studio Code**: Recommended IDE with Cocos Creator extensions
- **Chrome DevTools**: For debugging HTML5 builds
- **Android Studio**: For Android platform builds
- **Xcode**: For iOS platform builds (macOS only)

### Recommended Extensions
- Cocos Creator extension for VS Code
- TypeScript and JavaScript language support
- ESLint for code quality
- Prettier for code formatting

### Platform-Specific Requirements

#### Mobile Development
- Android SDK for Android builds
- iOS SDK for iOS builds (macOS only)
- Platform-specific certificates and provisioning profiles

#### Web Development
- Modern web browser for testing
- Web server for local testing
- HTTPS setup for testing web features

### Performance Testing Tools
- Chrome DevTools Performance tab
- Mobile device testing setup
- Network throttling tools for web builds