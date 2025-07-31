# Mobile Game Development Workflow

This workflow template guides you through creating a complete mobile game with Cocos Creator using specialized agents.

## Overview

**Target**: Full mobile game ready for app store submission  
**Timeline**: 4-8 weeks depending on scope  
**Platforms**: iOS, Android, potentially web  
**Monetization**: F2P with IAP and/or ads  

## Phase 1: Project Planning & Architecture (Week 1)

### Step 1.1: Initialize Development Team
```bash
claude "use @cocos-team-coordinator and set up the optimal AI team for a [GENRE] mobile game project with these requirements:
- Target platforms: iOS and Android
- Monetization: [IAP/Ads/Premium]
- Target audience: [Demographics]
- Key features: [List main features]"
```

### Step 1.2: Project Architecture Design
```bash
claude "use @cocos-project-architect and design a scalable architecture for a [GENRE] mobile game with:
- Estimated 50+ levels
- Social features and leaderboards
- In-app purchases and rewards
- Offline play capability
- Cloud save support"
```

**Expected Output:**
- Technical architecture document
- File structure and organization
- Performance targets and constraints
- Technology stack recommendations
- Development timeline estimate

### Step 1.3: Game Design Document
```bash
claude "use @cocos-[GENRE]-game-expert and create detailed game design covering:
- Core gameplay loop
- Progression mechanics
- Monetization integration
- Level design principles
- Balancing framework"
```

**Expected Output:**
- Complete game design document
- Gameplay mechanics specification
- Progression system design
- Monetization strategy
- Balancing guidelines

## Phase 2: Core Systems Development (Week 2-3)

### Step 2.1: Component Architecture
```bash
claude "use @cocos-component-architect and design the component system for:
- Player controller and abilities
- Game entities and interactions
- UI components and managers
- Audio and effects systems
- Save/load and settings management"
```

**Expected Output:**
- Component architecture diagram
- Reusable component library
- Entity-component patterns
- Communication protocols
- Performance considerations

### Step 2.2: Scene Management
```bash
claude "use @cocos-scene-analyzer and design scene architecture for:
- Main menu and navigation
- Gameplay scenes with transitions
- UI overlay management
- Loading and preloading systems
- Memory management between scenes"
```

**Expected Output:**
- Scene hierarchy design
- Scene transition system
- Asset preloading strategy
- Memory optimization plan
- Navigation flow diagram

### Step 2.3: Asset Management
```bash
claude "use @cocos-asset-manager and implement asset pipeline for:
- Dynamic loading and unloading
- Asset bundling strategy
- Texture optimization for mobile
- Audio compression and streaming
- Localization asset management"
```

**Expected Output:**
- Asset bundling configuration
- Loading system implementation
- Optimization guidelines
- Localization framework
- Asset versioning system

### Step 2.4: Core Gameplay Implementation
```bash
claude "use @cocos-[GENRE]-game-expert and implement core gameplay:
- Primary game mechanics
- Player controls and input handling
- Game state management
- Physics and collision systems
- Basic UI integration"
```

**Expected Output:**
- Core gameplay mechanics
- Input handling system
- Physics integration
- Game state machine
- Basic user interface

## Phase 3: Content & Progression Systems (Week 3-4)

### Step 3.1: Level Design System
```bash
claude "use @cocos-level-designer and create level design framework:
- Level data structure and editor
- Difficulty progression curve
- Procedural content generation (if applicable)
- Level validation and testing tools
- Content pipeline for designers"
```

**Expected Output:**
- Level design tools
- Content creation pipeline
- Difficulty balancing system
- Level validation framework
- Designer documentation

### Step 3.2: Progression & Retention
```bash
claude "use @cocos-progression-specialist and implement player progression:
- Experience and leveling system
- Achievement and milestone tracking
- Daily missions and challenges
- Reward systems and economies
- Social progression features"
```

**Expected Output:**
- Progression system implementation
- Achievement framework
- Daily content system
- Economic balancing
- Social features integration

### Step 3.3: Monetization Integration
```bash
claude "use @cocos-backend-integrator and implement monetization:
- In-app purchase system
- Reward video integration
- Virtual currency management
- Purchase validation and security
- Analytics for monetization tracking"
```

**Expected Output:**
- IAP implementation
- Ad integration
- Virtual economy
- Purchase security
- Monetization analytics

## Phase 4: UI/UX & Polish (Week 4-5)

### Step 4.1: UI Implementation
```bash
claude "use @cocos-ui-builder and create comprehensive UI system:
- Responsive layouts for different screen sizes
- Navigation and menu systems
- HUD and gameplay UI
- Settings and options screens
- Onboarding and tutorial interfaces"
```

**Expected Output:**
- Complete UI system
- Responsive design implementation
- Navigation framework
- Settings management
- Accessibility features

### Step 4.2: UX Optimization
```bash
claude "use @cocos-ux-designer and optimize user experience:
- Onboarding flow optimization
- User retention mechanics
- Conversion funnel analysis
- Accessibility improvements
- User feedback integration"
```

**Expected Output:**
- UX analysis and recommendations
- Optimized user flows
- Retention mechanics
- Accessibility compliance
- User testing framework

### Step 4.3: Tutorial & Onboarding
```bash
claude "use @cocos-tutorial-designer and create engaging onboarding:
- Progressive skill introduction
- Interactive tutorials
- Contextual help system
- First-time user experience
- Retention-focused onboarding"
```

**Expected Output:**
- Tutorial system implementation
- Onboarding flow
- Help and tips system
- FTUE optimization
- Retention measurement

### Step 4.4: Animation & Effects
```bash
claude "use @cocos-animation-specialist and implement visual polish:
- Character and object animations
- UI transitions and micro-interactions
- Particle effects and visual feedback
- Shader effects and post-processing
- Performance-optimized animations"
```

**Expected Output:**
- Animation system
- Visual effects library
- UI animation framework
- Shader implementations
- Performance optimizations

## Phase 5: Platform Integration & Optimization (Week 5-6)

### Step 5.1: Mobile Optimization
```bash
claude "use @cocos-mobile-optimizer and optimize for mobile devices:
- Performance profiling and optimization
- Battery usage minimization
- Memory usage optimization
- Network efficiency improvements
- Device-specific adaptations"
```

**Expected Output:**
- Performance optimization report
- Memory usage optimization
- Battery efficiency improvements
- Network optimization
- Device compatibility matrix

### Step 5.2: Platform Services Integration
```bash
claude "use @cocos-platform-integrator and integrate platform services:
- iOS Game Center / Google Play Games
- Cloud save functionality
- Push notification system
- Social sharing integration
- Platform-specific features"
```

**Expected Output:**
- Platform services integration
- Cloud save implementation
- Push notification system
- Social features
- Platform compliance

### Step 5.3: Backend Integration
```bash
claude "use @cocos-backend-integrator and connect backend services:
- User authentication and profiles
- Leaderboards and social features
- Analytics and crash reporting
- Remote configuration
- Live content updates"
```

**Expected Output:**
- Backend service integration
- User management system
- Analytics implementation
- Remote configuration
- Live update system

### Step 5.4: Security Implementation
```bash
claude "use @cocos-security-expert and implement security measures:
- Anti-cheat systems
- Data encryption and protection
- Secure communication protocols
- Privacy compliance (GDPR, COPPA)
- Purchase validation security"
```

**Expected Output:**
- Security system implementation
- Anti-cheat measures
- Data protection
- Privacy compliance
- Security audit results

## Phase 6: Testing & Quality Assurance (Week 6-7)

### Step 6.1: Performance Testing
```bash
claude "use @cocos-performance-optimizer and conduct comprehensive performance testing:
- Frame rate analysis across devices
- Memory leak detection
- Load time optimization
- Network performance testing
- Stress testing with edge cases"
```

**Expected Output:**
- Performance test results
- Optimization recommendations
- Device compatibility report
- Network performance analysis
- Stress test results

### Step 6.2: Code Review & Security Audit
```bash
claude "use @code-reviewer and @cocos-security-expert to conduct final review:
- Code quality and maintainability
- Security vulnerability assessment
- Performance bottleneck identification
- Best practices compliance
- Documentation completeness"
```

**Expected Output:**
- Code review report
- Security audit results
- Performance recommendations
- Best practices checklist
- Documentation updates

### Step 6.3: User Testing & Feedback
```bash
claude "use @cocos-ux-designer and plan user testing:
- Beta testing program setup
- User feedback collection system
- A/B testing for key features
- Conversion rate optimization
- Retention analysis preparation"
```

**Expected Output:**
- Beta testing program
- Feedback collection system
- A/B testing framework
- User research plan
- Analytics dashboard

## Phase 7: Launch Preparation (Week 7-8)

### Step 7.1: Store Submission Preparation
```bash
claude "use @cocos-platform-integrator and prepare app store submissions:
- iOS App Store submission package
- Google Play Store submission package
- Store assets and metadata
- Compliance documentation
- Release notes and descriptions"
```

**Expected Output:**
- Store submission packages
- Marketing assets
- Compliance documentation
- Release planning
- Store optimization

### Step 7.2: Analytics & Monitoring Setup
```bash
claude "use @cocos-analytics-specialist and implement comprehensive analytics:
- User behavior tracking
- Monetization analytics
- Performance monitoring
- Crash reporting and debugging
- Live dashboard setup"
```

**Expected Output:**
- Analytics implementation
- Monitoring dashboards
- Alert systems
- Performance tracking
- Business intelligence setup

### Step 7.3: Final Build & Deployment
```bash
claude "use @cocos-build-engineer and create production builds:
- iOS production build with proper certificates
- Android release build with signing
- Build automation and CI/CD setup
- Version management and rollback capability
- Distribution strategy implementation"
```

**Expected Output:**
- Production-ready builds
- Build automation
- Deployment pipeline
- Version control system
- Rollback procedures

## Post-Launch Support & Iteration

### Week 8+: Live Operations
```bash
# Monitor and respond to launch metrics
claude "use @cocos-analytics-specialist and analyze launch performance:
- User acquisition and retention
- Monetization performance
- Technical performance metrics
- User feedback analysis
- Competitive analysis"

# Implement live updates
claude "use @cocos-backend-integrator and prepare live content updates:
- Remote configuration updates
- New content deployment
- A/B testing of new features
- Event and promotion systems
- Community management tools"
```

## Success Metrics & KPIs

### Technical Metrics
- [ ] Load time: <3 seconds
- [ ] Frame rate: 60 FPS on mid-range devices
- [ ] Crash rate: <1%
- [ ] Memory usage: <500MB on target devices
- [ ] Battery drain: Minimal impact

### Business Metrics
- [ ] Day 1 retention: >40%
- [ ] Day 7 retention: >20%
- [ ] Day 30 retention: >10%
- [ ] ARPU: Target based on genre
- [ ] Conversion rate: >5% for IAP

### User Experience Metrics
- [ ] Tutorial completion: >80%
- [ ] Average session length: Target based on genre
- [ ] User rating: >4.0 stars
- [ ] Review sentiment: Positive
- [ ] Support ticket volume: Low

## Emergency Response Procedures

### Critical Issues
```bash
# Performance crisis
claude "use @cocos-performance-optimizer and @cocos-mobile-optimizer to immediately address critical performance issues"

# Monetization problems
claude "use @cocos-backend-integrator and debug IAP/ad integration issues"

# Security breach
claude "use @cocos-security-expert and implement emergency security measures"

# User experience crisis
claude "use @cocos-ux-designer and quickly improve user experience based on feedback"
```

## Scaling and Growth

### Content Updates
```bash
# Regular content updates
claude "use @cocos-level-designer and @cocos-progression-specialist to plan content roadmap"

# Seasonal events
claude "use @cocos-backend-integrator and design live event systems"

# New features
claude "use @cocos-project-architect and plan feature expansion architecture"
```

This comprehensive workflow ensures a professional mobile game development process with specialized AI assistance at every stage, from initial concept to live operations.