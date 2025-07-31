# Practical Usage Examples

This document provides real-world examples of how to use Cocos Creator Claude agents effectively in different scenarios.

## Quick Start Examples

### 🚀 New Project Setup (5 minutes)

**Scenario**: Starting a new puzzle game project
```bash
# 1. Initialize AI team
claude "use @cocos-team-coordinator and set up the optimal AI team for a match-3 puzzle game targeting mobile platforms"

# 2. Create project architecture
claude "use @cocos-project-architect and design architecture for a match-3 game with 100+ levels, social features, and IAP"

# 3. Setup core systems
claude "use @cocos-component-architect and create the foundational components for a match-3 puzzle game"
```

**Expected Results**: Complete project setup with architecture, file structure, and core components ready for development.

---

## Core Development Examples

### 🎮 Implementing Game Mechanics

**Scenario**: Creating a match-3 puzzle system
```bash
# Design the core mechanic
claude "use @cocos-puzzle-game-expert and implement a match-3 system with:
- Grid-based gem placement
- Match detection algorithm  
- Cascade and combo mechanics
- Power-up generation system
- Score calculation with multipliers"

# Add visual feedback
claude "use @cocos-animation-specialist and create satisfying animations for:
- Gem matching and destruction
- Cascade effects
- Power-up activations
- Victory celebrations"

# Optimize for mobile
claude "use @cocos-mobile-optimizer and ensure the match-3 system runs smoothly at 60 FPS on mid-range Android devices"
```

### 🎯 Level Design System

**Scenario**: Creating a level editor and progression system
```bash
# Build level design tools
claude "use @cocos-level-designer and create a level editor that allows designers to:
- Place obstacles and special tiles
- Set objectives and win conditions
- Preview and test levels
- Export level data for the game"

# Design difficulty progression
claude "use @cocos-progression-specialist and create a progression system with:
- Smooth difficulty curve over 100 levels
- Star rating system
- Achievement integration
- Daily challenges"
```

---

## UI/UX Implementation Examples

### 🎨 Mobile-First UI Design

**Scenario**: Creating responsive UI for different screen sizes
```bash
# Design responsive layouts
claude "use @cocos-ui-builder and create a responsive UI system that:
- Adapts to different screen ratios (16:9, 18:9, 19.5:9)
- Handles notch areas on modern phones
- Provides accessible touch targets (44pt minimum)
- Works in both portrait and landscape"

# Optimize user experience
claude "use @cocos-ux-designer and improve the onboarding flow to:
- Reduce time to first gameplay to under 10 seconds
- Achieve 90%+ tutorial completion rate
- Implement progressive disclosure of features
- Add contextual help throughout the game"
```

### 📱 Tutorial and Onboarding

**Scenario**: Creating engaging tutorials for a casual game
```bash
# Design tutorial system
claude "use @cocos-tutorial-designer and create an interactive tutorial that:
- Teaches core mechanics through gameplay, not text
- Uses visual highlighting and gesture recognition
- Allows players to skip but offers incentives to complete
- Tracks completion and identifies drop-off points"

# Optimize for retention
claude "use @cocos-ux-designer and implement first-time user experience optimization:
- Immediate gratification in first 30 seconds
- Clear progression indicators
- Social proof elements
- Comeback incentives for returning players"
```

---

## Performance & Optimization Examples

### ⚡ Mobile Performance Optimization

**Scenario**: Game running poorly on low-end Android devices
```bash
# Identify performance bottlenecks
claude "use @cocos-performance-optimizer and analyze my game's performance issues:
- Frame rate drops during particle effects
- Memory spikes when loading new levels
- Long loading times on slower devices
- Battery drain concerns from users"

# Implement mobile-specific optimizations
claude "use @cocos-mobile-optimizer and optimize for low-end devices:
- Reduce texture memory usage by 50%
- Implement object pooling for frequently created objects
- Add adaptive quality settings based on device performance
- Optimize audio compression and streaming"

# Test and validate improvements
claude "use @cocos-performance-optimizer and create a performance testing suite that:
- Measures FPS across different device tiers
- Tracks memory usage over extended play sessions
- Monitors battery usage impact
- Provides automated performance regression testing"
```

### 🔧 Asset Pipeline Optimization

**Scenario**: Large game with many assets causing build and runtime issues
```bash
# Optimize asset pipeline
claude "use @cocos-asset-manager and restructure our asset pipeline to:
- Implement dynamic loading for level-specific assets
- Create asset bundles for different content types
- Optimize texture compression for mobile platforms
- Set up automated asset validation and optimization"

# Implement progressive loading
claude "use @cocos-scene-analyzer and design a loading system that:
- Preloads essential assets for instant gameplay
- Streams additional content in background
- Provides smooth transitions between loaded states
- Handles network interruptions gracefully"
```

---

## Multiplayer & Networking Examples

### 🌐 Real-time Multiplayer Implementation

**Scenario**: Adding multiplayer to an existing single-player game
```bash
# Design multiplayer architecture
claude "use @cocos-multiplayer-architect and design real-time multiplayer for a puzzle game:
- 1v1 competitive matches with 2-minute rounds
- Spectator mode for finished players
- Reconnection handling for mobile networks
- Cross-platform play between iOS and Android"

# Implement backend integration
claude "use @cocos-backend-integrator and connect to multiplayer backend:
- Player authentication and profiles
- Matchmaking based on skill rating
- Leaderboards and seasonal rankings  
- Real-time messaging and notifications"

# Add security measures
claude "use @cocos-security-expert and implement anti-cheat for multiplayer:
- Server-side move validation
- Statistical analysis for impossible scores
- Rate limiting for API calls
- Encrypted communication protocols"
```

---

## Monetization & Analytics Examples

### 💰 Monetization Integration

**Scenario**: Implementing IAP and ads in a free-to-play game
```bash
# Implement in-app purchases
claude "use @cocos-backend-integrator and add IAP system:
- Virtual currency packages with bonus amounts
- Remove ads premium upgrade
- Level skip and hint purchases
- Subscription for unlimited play"

# Integrate rewarded ads
claude "use @cocos-backend-integrator and implement rewarded video ads:
- Extra moves in failed levels
- Double rewards for completed levels
- Free premium currency daily
- Unlock premium content temporarily"

# Track monetization metrics
claude "use @cocos-analytics-specialist and implement monetization analytics:
- Purchase funnel conversion tracking
- Ad engagement and completion rates
- Lifetime value cohort analysis
- A/B testing for pricing strategies"
```

### 📊 Analytics and Data-Driven Development

**Scenario**: Implementing comprehensive game analytics
```bash
# Setup core analytics
claude "use @cocos-analytics-specialist and implement game analytics:
- Player progression and level completion rates
- Session length and return frequency
- Feature usage and engagement metrics
- Crash reporting and error tracking"

# Create data-driven feedback loops
claude "use @cocos-ux-designer and setup data-driven UX optimization:
- Heatmaps for UI interaction patterns
- A/B testing for onboarding flows
- Cohort analysis for retention improvements
- Conversion funnel optimization"
```

---

## Playable Ads Development Examples

### 📱 High-Converting Playable Ad

**Scenario**: Creating a playable ad for user acquisition
```bash
# Design playable structure
claude "use @cocos-playable-architect and create a match-3 playable ad:
- 30-second gameplay demonstration
- Clear win condition achievable by most players
- Multiple strategic CTA placements
- Compelling end screen with app store preview"

# Implement rapid prototype
claude "use @cocos-rapid-prototyper and build functional prototype:
- Core match-3 mechanics working
- Basic UI and feedback systems
- Tutorial hand guidance
- Victory celebration and CTA"

# Optimize for conversion
claude "use @cocos-conversion-optimizer and maximize install rates:
- A/B testing different gameplay lengths
- Optimizing CTA button text and placement
- Adding social proof elements
- Implementing fail-safe mechanics for guaranteed wins"

# Compress for delivery
claude "use @cocos-playable-optimizer and optimize for ad networks:
- Reduce total size to under 2MB for Facebook
- Inline all assets for single-file delivery
- Minimize JavaScript and remove unused engine features
- Test across all major ad network specifications"
```

---

## Platform-Specific Development Examples

### 🍎 iOS App Store Optimization

**Scenario**: Preparing game for iOS App Store submission
```bash
# Implement iOS-specific features
claude "use @cocos-platform-integrator and add iOS features:
- Game Center leaderboards and achievements
- iCloud save data synchronization
- iOS 16 Lock Screen widgets (if applicable)
- Privacy manifest for App Store requirements"

# Optimize for App Store guidelines
claude "use @cocos-security-expert and ensure App Store compliance:
- Implement proper data collection consent
- Add parental controls for games targeting children
- Ensure no private API usage
- Implement proper in-app purchase validation"

# Prepare store assets
claude "use @cocos-platform-integrator and create App Store submission package:
- Generate all required icon sizes and launch images
- Create compelling App Store screenshots
- Write optimized app description with keywords
- Prepare app store metadata and ratings information"
```

### 🤖 Android Google Play Optimization

**Scenario**: Optimizing for Google Play Store and Android devices
```bash
# Implement Android-specific features
claude "use @cocos-platform-integrator and add Android features:
- Google Play Games integration
- Android App Bundle optimization
- Dynamic delivery for large games
- Adaptive icons and Android 13+ themed icons"

# Optimize for Play Console requirements
claude "use @cocos-security-expert and meet Google Play requirements:
- Target API level 33+ compliance
- Implement data safety declarations
- Add proper permissions justification
- Ensure Play Console policy compliance"
```

---

## Advanced Workflow Examples

### 🔄 Continuous Integration and Deployment

**Scenario**: Setting up automated build and deployment pipeline
```bash
# Setup build automation
claude "use @cocos-build-engineer and create CI/CD pipeline:
- Automated builds for multiple platforms
- Unit testing and integration testing
- Performance regression testing
- Automated deployment to internal testing"

# Implement quality gates
claude "use @code-reviewer and setup automated quality checks:
- Code quality analysis with performance impact assessment
- Security vulnerability scanning
- Asset optimization validation
- Cross-platform compatibility testing"
```

### 🎯 Live Operations and Updates

**Scenario**: Managing live game with regular content updates
```bash
# Setup live content management
claude "use @cocos-backend-integrator and implement live operations:
- Remote configuration for game balance
- A/B testing framework for new features
- Seasonal event and content management
- Push notification campaigns"

# Monitor and respond to live issues
claude "use @cocos-analytics-specialist and setup live monitoring:
- Real-time crash and error tracking
- Player behavior anomaly detection
- Revenue and KPI monitoring dashboards
- Automated alerting for critical issues"
```

---

## Troubleshooting Examples

### 🐛 Common Problem Scenarios

**Performance Issues**
```bash
# Game running slow on target devices
claude "use @cocos-performance-optimizer and diagnose performance issues in my puzzle game that's running at 20 FPS on mid-range Android devices"

# Memory leaks causing crashes
claude "use @cocos-mobile-optimizer and identify memory leaks causing crashes after 10 minutes of gameplay"
```

**User Experience Problems**
```bash
# High tutorial drop-off rate
claude "use @cocos-ux-designer and analyze why 60% of players abandon the tutorial before completion"

# Low retention rates
claude "use @cocos-progression-specialist and redesign progression to improve day-7 retention from 15% to 25%"
```

**Technical Integration Issues**
```bash
# IAP not working on iOS
claude "use @cocos-backend-integrator and debug iOS in-app purchase validation failures"

# Multiplayer connection problems
claude "use @cocos-multiplayer-architect and solve connection timeout issues affecting 30% of players"
```

---

## Success Patterns

### 🏆 Proven Workflows That Work

**The "30-Day MVP" Pattern**
```bash
# Week 1: Foundation
claude "use @cocos-team-coordinator, @cocos-project-architect, and @cocos-component-architect"

# Week 2: Core Gameplay  
claude "use @cocos-[genre]-game-expert, @cocos-ui-builder, @cocos-animation-specialist"

# Week 3: Polish & Integration
claude "use @cocos-ux-designer, @cocos-tutorial-designer, @cocos-backend-integrator"  

# Week 4: Optimization & Launch
claude "use @cocos-performance-optimizer, @cocos-platform-integrator, @cocos-build-engineer"
```

**The "Rapid Playable" Pattern** (24-48 hours)
```bash
# Hour 1-2: Setup and Design
claude "use @cocos-playable-architect and @cocos-rapid-prototyper"

# Hour 3-8: Core Implementation  
claude "use @cocos-[genre]-game-expert and @cocos-ui-builder"

# Hour 9-16: Polish and Optimize
claude "use @cocos-tutorial-designer and @cocos-conversion-optimizer"

# Hour 17-24: Size Optimization and Delivery
claude "use @cocos-playable-optimizer and @cocos-platform-integrator"
```

These examples demonstrate the practical application of Cocos Creator Claude agents across different development scenarios, from rapid prototyping to full production games.