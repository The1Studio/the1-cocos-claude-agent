# Playable Ad Development Workflow

This workflow template guides you through creating high-converting playable ads with Cocos Creator using specialized agents.

## Overview

**Target**: Create a 2-5MB playable ad with >15% conversion rate  
**Timeline**: 2-3 days from concept to delivery  
**Platforms**: Facebook, Google, Unity Ads, IronSource, AppLovin  

## Phase 1: Project Setup & Architecture (Day 1 Morning)

### Step 1.1: Initialize AI Team
```bash
claude "use @cocos-team-coordinator and set up the optimal AI team for a playable ad project"
```

### Step 1.2: Project Architecture
```bash
claude "use @cocos-project-architect and design architecture for a [GENRE] playable ad with these requirements:
- Target size: under 3MB
- Duration: 30 seconds gameplay
- Conversion goal: >15% install rate
- Platform: [Facebook/Google/Unity/etc]"
```

**Expected Output:**
- Project structure optimized for playables
- Asset pipeline configuration
- Performance targets and constraints
- Technical architecture diagram

### Step 1.3: Playable Structure Design
```bash
claude "use @cocos-playable-architect and create the core playable ad structure with:
- Quick tutorial (5 seconds)
- Core gameplay (20 seconds)  
- Clear CTA strategy
- Conversion optimization hooks"
```

**Expected Output:**
- Playable flow diagram
- CTA placement strategy
- Tutorial design
- Core component structure

## Phase 2: Core Development (Day 1 Afternoon)

### Step 2.1: Rapid Prototyping
```bash
claude "use @cocos-rapid-prototyper and create a [GENRE] playable prototype with:
- Core mechanic: [describe mechanic]
- Win condition: [describe win condition]
- Basic tutorial flow
- Placeholder art and UI"
```

**Expected Output:**
- Playable prototype
- Core gameplay mechanics
- Basic tutorial system
- Placeholder assets

### Step 2.2: Gameplay Implementation
```bash
claude "use @cocos-[GENRE]-game-expert and implement the core gameplay mechanics:
- [Specific mechanic 1]
- [Specific mechanic 2]
- Win/lose conditions
- Progression feedback"
```

**Expected Output:**
- Polished gameplay mechanics
- Proper game states
- User feedback systems
- Basic balancing

### Step 2.3: UI Foundation
```bash
claude "use @cocos-ui-builder and create the playable UI with:
- Responsive design for mobile
- Clear visual hierarchy
- Touch-friendly interactions
- CTA button integration"
```

**Expected Output:**
- Responsive UI layouts
- Mobile-optimized controls
- Visual feedback systems
- CTA integration

## Phase 3: Tutorial & UX Optimization (Day 2 Morning)

### Step 3.1: Tutorial Design
```bash
claude "use @cocos-tutorial-designer and create an engaging tutorial that:
- Gets player to core mechanic in <5 seconds
- Uses visual guidance instead of text
- Ensures 90%+ tutorial completion
- Leads naturally to CTA"
```

**Expected Output:**
- Visual tutorial system
- Hand animation guides
- Progress indicators
- Tutorial completion tracking

### Step 3.2: UX Optimization
```bash
claude "use @cocos-ux-designer and optimize the player experience for conversion:
- Analyze user flow for friction points
- Optimize onboarding sequence
- Design engaging fail/success states
- Implement conversion psychology principles"
```

**Expected Output:**
- UX analysis report
- Optimized user flows
- Conversion optimization features
- A/B testing recommendations

### Step 3.3: Conversion Optimization
```bash
claude "use @cocos-conversion-optimizer and implement conversion features:
- Strategic CTA placement and timing
- Social proof elements
- FOMO triggers
- Celebration moments that lead to install"
```

**Expected Output:**
- Multiple CTA strategies
- Conversion tracking events
- Social proof systems
- Engagement amplifiers

## Phase 4: Size Optimization & Polish (Day 2 Afternoon)

### Step 4.1: Asset Optimization
```bash
claude "use @cocos-playable-optimizer and optimize the playable for size:
- Target: under [SIZE]MB
- Compress all textures and audio
- Inline assets for single-file delivery
- Remove unused engine modules"
```

**Expected Output:**
- Size-optimized assets
- Single HTML file build
- Performance metrics
- Size breakdown report

### Step 4.2: Performance Optimization
```bash
claude "use @cocos-mobile-optimizer and ensure smooth performance:
- Target: 30+ FPS on low-end devices
- Optimize draw calls and memory usage
- Test on various screen sizes
- Implement adaptive quality settings"
```

**Expected Output:**
- Performance optimizations
- Multi-resolution support
- Adaptive quality system
- Performance benchmarks

### Step 4.3: Platform Adaptation
```bash
claude "use @cocos-platform-integrator and prepare for [TARGET_PLATFORM]:
- Platform-specific size limits
- MRAID compliance
- Platform optimization requirements
- Export configuration"
```

**Expected Output:**
- Platform-specific builds
- Compliance validation
- Export configurations
- Platform testing setup

## Phase 5: Testing & Delivery (Day 3)

### Step 5.1: Quality Assurance
```bash
claude "use @code-reviewer and perform comprehensive review:
- Code quality and performance
- Security considerations for playables
- Platform compliance check
- User experience validation"
```

**Expected Output:**
- Code review report
- Security assessment
- Compliance checklist
- Bug fixes and improvements

### Step 5.2: Analytics Integration
```bash
claude "use @cocos-analytics-specialist and implement playable analytics:
- Conversion funnel tracking
- User interaction events
- Performance metrics
- A/B testing framework"
```

**Expected Output:**
- Analytics implementation
- Event tracking system
- Performance monitoring
- A/B testing setup

### Step 5.3: Final Build & Validation
```bash
claude "use @cocos-build-engineer and create final delivery builds:
- Generate platform-specific exports
- Validate all size and performance requirements
- Create testing versions
- Package for delivery"
```

**Expected Output:**
- Final production builds
- Platform-specific packages
- Testing documentation
- Delivery checklist

## Phase 6: Launch Preparation

### Step 6.1: Store Assets
```bash
claude "use @cocos-platform-integrator and prepare store assets:
- Generate required screenshots
- Create store descriptions
- Prepare metadata
- Compliance documentation"
```

### Step 6.2: A/B Testing Setup
```bash
claude "Set up A/B testing framework for:
- Different CTA timings
- Various tutorial approaches
- Multiple end screens
- Different celebration moments"
```

## Success Metrics & Validation

### Technical Validation
- [ ] Size: Under target MB limit
- [ ] Performance: 30+ FPS on test devices
- [ ] Load time: <3 seconds on 3G
- [ ] Platform compliance: 100% validated

### UX Validation  
- [ ] Tutorial completion: >90%
- [ ] Average session: 25-35 seconds
- [ ] User interaction rate: >80%
- [ ] Clear CTA presentation: 100%

### Conversion Validation
- [ ] Conversion rate: >15% (target varies by platform)
- [ ] Engagement rate: >60%
- [ ] Completion rate: >70%
- [ ] Install intent signals: Strong

## Common Pitfalls & Solutions

### Size Bloat
**Problem**: Playable exceeds size limit  
**Solution**: Use `@cocos-playable-optimizer` for aggressive optimization

### Poor Conversion
**Problem**: Low install rates  
**Solution**: Use `@cocos-ux-designer` and `@cocos-conversion-optimizer` for analysis

### Platform Rejection
**Problem**: Platform compliance issues  
**Solution**: Use `@cocos-platform-integrator` for platform-specific requirements

### Performance Issues
**Problem**: Lag on target devices  
**Solution**: Use `@cocos-mobile-optimizer` and `@cocos-performance-optimizer`

## Iterative Improvement

After initial launch:

1. **Analyze Performance**: Use analytics to identify drop-off points
2. **A/B Test Variations**: Test different approaches systematically  
3. **Optimize Based on Data**: Use `@cocos-ux-designer` for data-driven improvements
4. **Scale Successful Patterns**: Apply learnings to new playables

## Quick Reference Commands

```bash
# Emergency size reduction
claude "use @cocos-playable-optimizer and aggressively reduce size to under [X]MB"

# Conversion crisis fix
claude "use @cocos-conversion-optimizer and analyze why conversion rate is low"

# Performance emergency
claude "use @cocos-mobile-optimizer and fix performance issues on low-end devices"

# Platform compliance fix
claude "use @cocos-platform-integrator and resolve [PLATFORM] compliance issues"
```

## Success Pattern Template

For maximum efficiency, use this template for new playables:

```bash
# 1. Setup (15 minutes)
claude "use @cocos-team-coordinator and configure team for [GENRE] playable"

# 2. Architecture (30 minutes)  
claude "use @cocos-project-architect and @cocos-playable-architect to design [GENRE] playable for [PLATFORM]"

# 3. Rapid prototype (2 hours)
claude "use @cocos-rapid-prototyper and create working [GENRE] prototype"

# 4. Polish & optimize (4 hours)
claude "use @cocos-ux-designer, @cocos-tutorial-designer, and @cocos-conversion-optimizer to optimize for conversion"

# 5. Size & performance (2 hours)
claude "use @cocos-playable-optimizer and @cocos-mobile-optimizer to meet technical requirements" 

# 6. Delivery (1 hour)
claude "use @cocos-platform-integrator and @cocos-build-engineer for final delivery"
```

This workflow ensures consistent, high-quality playable ads that meet platform requirements and conversion goals.