# Cocos Creator Development Best Practices

This guide covers best practices for using Claude agents in Cocos Creator game development.

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