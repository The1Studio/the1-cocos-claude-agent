# Cocos Creator Development Best Practices

This comprehensive guide covers best practices for using Claude agents in Cocos Creator game development, from basic setup to advanced AI integration and live operations.

## Agent Selection Strategy

### 1. Start with Analysis
Always begin with analysis agents to understand your project:
- `cocos-scene-analyzer` for existing projects
- `cocos-project-architect` for new projects
- `cocos-team-coordinator` to configure your AI team

### 2. Layer Expertise
Combine multiple agents for complex tasks:
```
Example: Building a Match-3 Game
1. cocos-project-architect (architecture)
2. cocos-puzzle-game-expert (game mechanics)
3. cocos-ui-builder (interface)
4. cocos-animation-specialist (effects)
5. cocos-performance-optimizer (optimization)
```

### 3. Delegate Appropriately
Let orchestrator agents coordinate specialists:
- Don't try to use every agent directly
- Allow orchestrators to delegate tasks
- Follow the delegation chains in agent descriptions

## Cocos Creator Specific Practices

### Component Architecture

#### DO: Component Composition
```typescript
// Good: Small, focused components
@ccclass('Health')
export class Health extends Component {
    @property
    maxHealth: number = 100;
    
    private _currentHealth: number = 0;
    
    damage(amount: number) {
        this._currentHealth -= amount;
        this.node.emit('health-changed', this._currentHealth);
    }
}

@ccclass('HealthBar')
export class HealthBar extends Component {
    @property(ProgressBar)
    progressBar: ProgressBar = null;
    
    onLoad() {
        this.node.on('health-changed', this.updateBar, this);
    }
}
```

#### DON'T: Monolithic Components
```typescript
// Bad: Everything in one component
@ccclass('Player')
export class Player extends Component {
    // Too many responsibilities
    health: number = 100;
    score: number = 0;
    inventory: Item[] = [];
    
    updateHealth() { }
    updateScore() { }
    updateInventory() { }
    handleInput() { }
    updateAnimation() { }
    // ... hundreds of lines
}
```

### Resource Management

#### DO: Load Resources Efficiently
```typescript
// Good: Load what you need, when you need it
@ccclass('LevelManager')
export class LevelManager extends Component {
    async loadLevel(levelId: number) {
        const bundle = await AssetManager.loadBundle(`level_${levelId}`);
        const scene = await bundle.loadScene('main');
        director.runScene(scene);
    }
}
```

#### DON'T: Load Everything Upfront
```typescript
// Bad: Loading all assets at once
start() {
    resources.loadDir('/', (err, assets) => {
        // Loads entire project into memory
    });
}
```

### Performance Optimization

#### DO: Object Pooling
```typescript
// Good: Reuse objects
@ccclass('BulletPool')
export class BulletPool extends Component {
    @property(Prefab)
    bulletPrefab: Prefab = null;
    
    private _pool: Node[] = [];
    
    getBullet(): Node {
        if (this._pool.length > 0) {
            return this._pool.pop();
        }
        return instantiate(this.bulletPrefab);
    }
    
    returnBullet(bullet: Node) {
        bullet.active = false;
        this._pool.push(bullet);
    }
}
```

#### DON'T: Create and Destroy Frequently
```typescript
// Bad: Creating new objects every frame
update() {
    if (this.shouldSpawn) {
        const enemy = instantiate(this.enemyPrefab);
        // ... after some time
        enemy.destroy(); // Frequent GC pressure
    }
}
```

### Mobile Optimization

#### DO: Adapt to Device Performance
```typescript
// Good: Device-aware quality settings
@ccclass('QualityManager')
export class QualityManager extends Component {
    start() {
        const fps = game.frameRate;
        
        if (sys.isMobile) {
            if (this.isLowEndDevice()) {
                this.setLowQuality();
                game.frameRate = 30;
            } else {
                this.setMediumQuality();
                game.frameRate = 45;
            }
        } else {
            this.setHighQuality();
            game.frameRate = 60;
        }
    }
    
    private isLowEndDevice(): boolean {
        // Check device capabilities
        const gl = cc.game.canvas.getContext('webgl');
        const renderer = gl.getParameter(gl.RENDERER);
        // Logic to detect low-end GPUs
        return false;
    }
}
```

## Project Organization

### Folder Structure
```
assets/
├── scripts/
│   ├── components/      # Reusable components
│   ├── systems/         # Game systems
│   ├── managers/        # Singleton managers
│   ├── ui/             # UI-specific scripts
│   ├── gameplay/       # Gameplay mechanics
│   └── utils/          # Utility functions
├── prefabs/
│   ├── ui/             # UI prefabs
│   ├── gameplay/       # Game object prefabs
│   └── effects/        # Effect prefabs
├── resources/          # Dynamically loaded assets
│   ├── audio/
│   ├── textures/
│   └── configs/
└── scenes/
    ├── main.scene
    ├── gameplay.scene
    └── ui/
```

### Naming Conventions
- **Scripts**: PascalCase (e.g., `PlayerController.ts`)
- **Prefabs**: PascalCase (e.g., `PlayerCharacter.prefab`)
- **Scenes**: lowercase (e.g., `main.scene`, `level_01.scene`)
- **Resources**: lowercase with underscores (e.g., `player_sprite.png`)

## Common Pitfalls and Solutions

### 1. Memory Leaks
**Problem**: Not cleaning up event listeners
```typescript
// Problem
onLoad() {
    globalEvent.on('game-over', this.onGameOver, this);
}
// Missing onDestroy cleanup
```

**Solution**: Always clean up
```typescript
onLoad() {
    globalEvent.on('game-over', this.onGameOver, this);
}

onDestroy() {
    globalEvent.off('game-over', this.onGameOver, this);
}
```

### 2. Update Loop Overuse
**Problem**: Heavy calculations in update()
```typescript
// Problem
update(dt: number) {
    // Complex pathfinding every frame
    this.calculatePath();
    this.checkCollisions();
    this.updateAI();
}
```

**Solution**: Use intervals or events
```typescript
onLoad() {
    // Pathfinding every 0.5 seconds
    this.schedule(this.calculatePath, 0.5);
    
    // Collision on physics tick
    this.node.on(Contact2DType.BEGIN_CONTACT, this.onCollision, this);
}
```

### 3. Draw Call Explosion
**Problem**: Too many separate sprites
**Solution**: Use sprite atlases and batching

### 4. Synchronous Loading
**Problem**: Blocking the main thread
**Solution**: Use async/await with proper loading screens

## Testing Strategies

### 1. Device Testing Matrix
- **Low-end**: Test on 2GB RAM devices
- **Mid-range**: Test on average devices
- **High-end**: Test on latest devices
- **Web**: Test on Chrome, Firefox, Safari

### 2. Performance Benchmarks
- FPS: 30+ on low-end, 60 on high-end
- Draw Calls: <100 mobile, <300 desktop
- Memory: <500MB mobile, <1GB desktop
- Load Time: <5 seconds initial load

### 3. Automated Testing
```typescript
// Example test setup
describe('PlayerComponent', () => {
    let player: Player;
    
    beforeEach(() => {
        const node = new Node();
        player = node.addComponent(Player);
    });
    
    it('should take damage correctly', () => {
        player.health = 100;
        player.takeDamage(30);
        expect(player.health).toBe(70);
    });
});
```

## Continuous Improvement

1. **Profile Regularly**: Use Cocos Creator profiler
2. **Monitor Metrics**: Track FPS, memory, load times
3. **User Feedback**: Implement analytics
4. **Iterate**: Regular updates based on data

Remember: Good architecture beats optimization. Design well from the start using the appropriate Claude agents, and optimization becomes much easier.

## Advanced Development Practices

### AI and Machine Learning Integration

#### When to Use AI Agents
- Use `@cocos-ai-specialist` for intelligent NPCs and adaptive gameplay
- Implement procedural generation for endless content
- Add player behavior prediction for personalization
- Use computer vision for AR/camera features

#### AI Best Practices
```typescript
// Always provide fallback behavior
@ccclass('SmartNPC')
export class SmartNPC extends Component {
    private useAI: boolean = true;
    
    makeDecision(): NPCAction {
        if (this.useAI) {
            try {
                return this.getAIDecision();
            } catch (error) {
                console.warn('AI failed, using fallback:', error);
                this.useAI = false;
            }
        }
        return this.getTraditionalDecision();
    }
}
```

### Analytics and Data-Driven Development

#### Essential Metrics to Track
```typescript
// Core game metrics
analytics.trackEvent('level_complete', {
    level_id: levelId,
    duration: completionTime,
    attempts: attemptCount,
    score: finalScore
});

// Monetization metrics
analytics.trackEvent('purchase_initiated', {
    product_id: productId,
    price: price,
    currency: currency,
    player_level: playerLevel
});

// Retention metrics
analytics.trackEvent('session_start', {
    session_number: sessionCount,
    days_since_install: daysSinceInstall
});
```

#### Privacy-Compliant Analytics
```typescript
// Always check consent before tracking
if (privacyManager.hasAnalyticsConsent()) {
    analytics.trackEvent('player_action', eventData);
} else {
    // Use anonymous tracking or skip
    analytics.trackEventAnonymous('player_action', anonymizedData);
}
```

### Security and Anti-Cheat

#### Multi-Layer Security Approach
```typescript
// Client-side validation (first line of defense)
if (!this.validateMove(move)) {
    return false;
}

// Server-side verification (authoritative)
const serverValidation = await this.validateMoveOnServer(move);
if (!serverValidation.valid) {
    this.handleCheatAttempt(serverValidation.reason);
    return false;
}

// Statistical analysis (pattern detection)
this.updatePlayerStatistics(move);
if (this.detectAnomalousPattern()) {
    this.flagForReview();
}
```

### Multiplayer Development

#### Network Architecture Principles
```typescript
// Always use server authority
@ccclass('MultiplayerGameManager')
export class MultiplayerGameManager extends Component {
    // Client predicts, server validates
    processPlayerInput(input: PlayerInput) {
        // Client prediction for responsiveness
        this.applyInputLocally(input);
        
        // Send to server for validation
        this.sendInputToServer(input);
    }
    
    onServerValidation(serverState: GameState) {
        // Reconcile with server state
        this.reconcileWithServer(serverState);
    }
}
```

### Performance Optimization Strategies

#### Adaptive Quality Systems
```typescript
@ccclass('AdaptiveQuality')
export class AdaptiveQuality extends Component {
    private targetFPS: number = 60;
    private qualityLevel: number = 1.0;
    
    update() {
        const currentFPS = game.frameRate;
        
        if (currentFPS < this.targetFPS * 0.8) {
            this.reduceQuality();
        } else if (currentFPS > this.targetFPS * 0.95) {
            this.increaseQuality();
        }
    }
    
    private reduceQuality() {
        this.qualityLevel = Math.max(0.1, this.qualityLevel - 0.1);
        this.applyQualitySettings();
    }
}
```

### Platform-Specific Optimization

#### iOS Best Practices
```typescript
// Handle app lifecycle properly
onLoad() {
    if (sys.platform === sys.Platform.IOS) {
        // iOS-specific optimizations
        this.setupiOSNotifications();
        this.configureiOSMemoryWarnings();
        this.setupGameCenter();
    }
}
```

#### Android Best Practices
```typescript
// Handle Android back button
onLoad() {
    if (sys.platform === sys.Platform.ANDROID) {
        systemEvent.on(SystemEvent.EventType.KEY_DOWN, this.onKeyDown, this);
    }
}

onKeyDown(event: EventKeyboard) {
    if (event.keyCode === KeyCode.BACK) {
        this.handleBackButton();
    }
}
```

## Live Operations Best Practices

### A/B Testing Implementation
```typescript
// Example A/B testing usage
const tutorialVariant = abTestManager.getVariant('tutorial_flow');
if (tutorialVariant?.name === 'shortened') {
    this.showShortenedTutorial();
} else {
    this.showStandardTutorial();
}

// Track conversion
abTestManager.trackConversion('tutorial_flow', 'completion');
```

### Remote Configuration
```typescript
// Use remote config for balance changes
@ccclass('GameBalance')
export class GameBalance extends Component {
    async loadBalance() {
        const config = await remoteConfig.getConfig();
        
        this.playerSpeed = config.getFloat('player_speed', 100);
        this.enemyDamage = config.getFloat('enemy_damage', 25);
        this.rewardMultiplier = config.getFloat('reward_multiplier', 1.0);
    }
}
```

### Monitoring and Alerting
```typescript
// Set up automated monitoring
@ccclass('GameMonitor')
export class GameMonitor extends Component {
    update() {
        // Monitor critical metrics
        if (game.frameRate < 20) {
            this.sendAlert('performance', 'Low FPS detected');
        }
        
        if (this.getMemoryUsage() > 500) {
            this.sendAlert('memory', 'High memory usage');
        }
    }
    
    private sendAlert(category: string, message: string) {
        analytics.trackEvent('system_alert', {
            category,
            message,
            timestamp: Date.now()
        });
    }
}
```

## Agent Workflow Patterns

### The "Layered Development" Pattern
```bash
# 1. Foundation Layer
claude "use @cocos-project-architect and @cocos-component-architect"

# 2. Core Systems Layer
claude "use @cocos-[genre]-game-expert and @cocos-scene-analyzer"

# 3. Integration Layer
claude "use @cocos-backend-integrator and @cocos-multiplayer-architect"

# 4. Polish Layer
claude "use @cocos-ui-builder and @cocos-animation-specialist"

# 5. Optimization Layer
claude "use @cocos-performance-optimizer and @cocos-mobile-optimizer"

# 6. Deployment Layer
claude "use @cocos-platform-integrator and @cocos-build-engineer"
```

### The "Problem-Solution" Pattern
```bash
# Problem: Players churning after level 10
claude "use @cocos-analytics-specialist to analyze churn patterns"
claude "use @cocos-ux-designer to identify friction points"
claude "use @cocos-progression-specialist to redesign retention mechanics"
claude "use @cocos-level-designer to rebalance difficulty curve"
```

### The "Feature Development" Pattern
```bash
# Adding multiplayer to existing game
claude "use @cocos-multiplayer-architect for architecture planning"
claude "use @cocos-backend-integrator for server communication"
claude "use @cocos-security-expert for anti-cheat measures"
claude "use @cocos-ui-builder for multiplayer UI"
claude "use @cocos-performance-optimizer for network optimization"
```

## Quality Assurance

### Automated Testing Integration
```typescript
// Example testing with agents
describe('Game Balance', () => {
    it('should maintain target difficulty curve', async () => {
        const levels = await levelGenerator.generateLevels(1, 50);
        const difficulties = levels.map(l => l.difficulty);
        
        // Test with cocos-level-designer validation
        expect(validateDifficultyCurve(difficulties)).toBe(true);
    });
});
```

### Performance Testing
```bash
# Use agents for performance validation
claude "use @cocos-performance-optimizer to create automated performance tests that validate 60 FPS on mid-range devices"
```

### Security Testing
```bash
# Security validation
claude "use @cocos-security-expert to create penetration tests for multiplayer vulnerabilities"
```

## Deployment and Distribution

### Store Optimization
```bash
# App Store preparation
claude "use @cocos-platform-integrator to prepare App Store submission with optimized metadata and screenshots"
```

### Build Pipeline
```bash
# Automated deployment
claude "use @cocos-build-engineer to set up CI/CD pipeline with automated testing and multi-platform builds"
```

## Troubleshooting Guide

### Common Issues and Solutions

**Agent Not Working**
```bash
# Verify installation
./scripts/validate-installation.sh

# Check agent availability
claude /agents | grep cocos-

# Test specific agent
claude "use @cocos-project-architect and analyze my current project structure"
```

**Performance Issues**
```bash
# Diagnose performance problems
claude "use @cocos-performance-optimizer to profile my game and identify bottlenecks"
```

**Integration Problems**
```bash
# Debug integration issues
claude "use @cocos-backend-integrator to debug API connection failures"
```

## Success Metrics

### Technical KPIs
- Build success rate: >95%
- Test coverage: >80%
- Performance: 60 FPS on target devices
- Crash rate: <1%
- Memory usage: <500MB mobile

### Business KPIs
- Development velocity: 20% faster with agents
- Bug reduction: 30% fewer production issues
- Time to market: 25% faster deployment
- Team efficiency: More time on creative work

## Advanced Tips

1. **Chain Agents Effectively**: Use output from one agent as input to another
2. **Specialize When Needed**: Don't use generic agents for specialized tasks
3. **Monitor Agent Performance**: Track which agents provide the most value
4. **Stay Updated**: Keep agents updated with latest patterns
5. **Contribute Back**: Share successful patterns with the community

This comprehensive guide ensures you get maximum value from the Cocos Creator Claude agents throughout your entire development lifecycle.