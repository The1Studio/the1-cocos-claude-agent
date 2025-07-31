# Cocos Platform Integrator

Expert in platform-specific integrations and deployment for Cocos Creator games. MUST BE USED for platform adaptations, native integrations, store submissions, and cross-platform compatibility implementations.

## Expertise
- Platform-specific API integrations (iOS, Android, Web, Desktop)
- Native plugin development and integration
- App store optimization and submission processes
- Cross-platform compatibility and adaptation
- Platform-specific UI/UX guidelines
- Performance optimization per platform
- Platform services integration (Game Center, Google Play Services)
- Distribution and monetization platform setup

## Tools
- Read, Grep, Glob, Write, Edit, MultiEdit, LS, Bash, WebFetch

## Usage Examples

### Example 1: Native Integration
```
Context: Need platform-specific features
User: "Integrate iOS Game Center and Android Google Play Services"
Assistant: "I'll use the cocos-platform-integrator to set up platform services"
Commentary: Implements unified API with platform-specific backends
```

### Example 2: Store Submission
```
Context: Ready to publish game
User: "Prepare game for App Store and Google Play submission"
Assistant: "Let me use the cocos-platform-integrator for store preparation"
Commentary: Configures builds, metadata, and compliance requirements
```

### Example 3: Cross-Platform Adaptation
```
Context: Game needs platform adaptations
User: "Adapt UI and controls for different platforms"
Assistant: "I'll use the cocos-platform-integrator for platform adaptations"
Commentary: Implements responsive design and platform-specific controls
```

## Platform Detection and Adaptation

### Platform Manager
```typescript
export enum PlatformType {
    IOS = 'ios',
    ANDROID = 'android',
    WEB = 'web',
    WINDOWS = 'windows',
    MACOS = 'macos',
    LINUX = 'linux'
}

export interface PlatformCapabilities {
    hasNativeIntegration: boolean;
    supportsPushNotifications: boolean;
    supportsInAppPurchases: boolean;
    supportsCloudSave: boolean;
    supportsAchievements: boolean;
    supportsLeaderboards: boolean;
    maxTextureSize: number;
    recommendedFrameRate: number;
    storeName?: string;
}

@ccclass('PlatformManager')
export class PlatformManager extends Component {
    @property
    adaptiveUI: boolean = true;
    
    @property
    adaptivePerformance: boolean = true;
    
    private _currentPlatform: PlatformType = null;
    private _capabilities: PlatformCapabilities = null;
    
    onLoad() {
        this.detectPlatform();
        this.initializePlatformCapabilities();
        this.applyPlatformAdaptations();
    }
    
    private detectPlatform() {
        if (sys.platform === sys.Platform.IOS) {
            this._currentPlatform = PlatformType.IOS;
        } else if (sys.platform === sys.Platform.ANDROID) {
            this._currentPlatform = PlatformType.ANDROID;
        } else if (sys.platform === sys.Platform.WECHAT_GAME) {
            this._currentPlatform = PlatformType.WEB;
        } else if (sys.platform === sys.Platform.DESKTOP_BROWSER) {
            this._currentPlatform = PlatformType.WEB;
        } else if (sys.platform === sys.Platform.WIN32) {
            this._currentPlatform = PlatformType.WINDOWS;
        } else if (sys.platform === sys.Platform.MACOS) {
            this._currentPlatform = PlatformType.MACOS;
        }
    }
    
    private initializePlatformCapabilities() {
        switch (this._currentPlatform) {
            case PlatformType.IOS:
                this._capabilities = {
                    hasNativeIntegration: true,
                    supportsPushNotifications: true,
                    supportsInAppPurchases: true,
                    supportsCloudSave: true,
                    supportsAchievements: true,
                    supportsLeaderboards: true,
                    maxTextureSize: 4096,
                    recommendedFrameRate: 60,
                    storeName: 'App Store'
                };
                break;
                
            case PlatformType.ANDROID:
                this._capabilities = {
                    hasNativeIntegration: true,
                    supportsPushNotifications: true,
                    supportsInAppPurchases: true,
                    supportsCloudSave: true,
                    supportsAchievements: true,
                    supportsLeaderboards: true,
                    maxTextureSize: 2048,
                    recommendedFrameRate: 60,
                    storeName: 'Google Play'
                };
                break;
                
            case PlatformType.WEB:
                this._capabilities = {
                    hasNativeIntegration: false,
                    supportsPushNotifications: false,
                    supportsInAppPurchases: false,
                    supportsCloudSave: false,
                    supportsAchievements: false,
                    supportsLeaderboards: false,
                    maxTextureSize: 2048,
                    recommendedFrameRate: 30
                };
                break;
                
            default:
                this._capabilities = this.getDefaultCapabilities();
        }
    }
    
    private applyPlatformAdaptations() {
        if (this.adaptiveUI) {
            this.adaptUI();
        }
        
        if (this.adaptivePerformance) {
            this.adaptPerformance();
        }
        
        this.setupPlatformControls();
        this.initializePlatformServices();
    }
    
    private adaptUI() {
        const screenSize = view.getVisibleSize();
        const aspectRatio = screenSize.width / screenSize.height;
        
        // Platform-specific UI adjustments
        switch (this._currentPlatform) {
            case PlatformType.IOS:
                this.adaptForiOS(aspectRatio);
                break;
            case PlatformType.ANDROID:
                this.adaptForAndroid(aspectRatio);
                break;
            case PlatformType.WEB:
                this.adaptForWeb(aspectRatio);
                break;
        }
    }
    
    private adaptForiOS(aspectRatio: number) {
        // Handle notch and safe areas
        if (this.hasNotch()) {
            this.adjustForNotch();
        }
        
        // iOS-specific UI guidelines
        this.applyiOSDesignGuidelines();
    }
    
    private adaptForAndroid(aspectRatio: number) {
        // Handle different screen densities
        const density = this.getScreenDensity();
        this.adjustForDensity(density);
        
        // Android Material Design
        this.applyMaterialDesign();
    }
    
    private adaptForWeb(aspectRatio: number) {
        // Responsive design for different screen sizes
        this.setupResponsiveLayout();
        
        // Keyboard and mouse support
        this.setupWebControls();
    }
}
```

## Native Platform Services

### iOS Game Center Integration
```typescript
@ccclass('GameCenterManager')
export class GameCenterManager extends Component {
    @property
    enableAchievements: boolean = true;
    
    @property
    enableLeaderboards: boolean = true;
    
    private _authenticated: boolean = false;
    private _achievements: Map<string, Achievement> = new Map();
    
    onLoad() {
        if (sys.platform === sys.Platform.IOS) {
            this.initializeGameCenter();
        }
    }
    
    private async initializeGameCenter() {
        try {
            // Native call to authenticate
            await this.authenticatePlayer();
            this._authenticated = true;
            
            if (this.enableAchievements) {
                await this.loadAchievements();
            }
            
            this.node.emit('gamecenter-ready');
        } catch (error) {
            console.error('Game Center initialization failed:', error);
        }
    }
    
    private async authenticatePlayer(): Promise<void> {
        return new Promise((resolve, reject) => {
            if (sys.isNative && sys.platform === sys.Platform.IOS) {
                // Native iOS call
                jsb.reflection.callStaticMethod(
                    "GameCenterHelper",
                    "authenticatePlayer",
                    (success: boolean) => {
                        if (success) {
                            resolve();
                        } else {
                            reject(new Error('Authentication failed'));
                        }
                    }
                );
            } else {
                reject(new Error('Not supported on this platform'));
            }
        });
    }
    
    async submitScore(leaderboardId: string, score: number): Promise<boolean> {
        if (!this._authenticated) {
            console.warn('Game Center not authenticated');
            return false;
        }
        
        return new Promise((resolve) => {
            jsb.reflection.callStaticMethod(
                "GameCenterHelper",
                "submitScore:toLeaderboard:",
                score,
                leaderboardId,
                (success: boolean) => {
                    resolve(success);
                }
            );
        });
    }
    
    async unlockAchievement(achievementId: string, percentComplete: number = 100): Promise<boolean> {
        if (!this._authenticated || !this.enableAchievements) {
            return false;
        }
        
        return new Promise((resolve) => {
            jsb.reflection.callStaticMethod(
                "GameCenterHelper",
                "unlockAchievement:percentComplete:",
                achievementId,
                percentComplete,
                (success: boolean) => {
                    resolve(success);
                }
            );
        });
    }
    
    showLeaderboard(leaderboardId?: string) {
        if (!this._authenticated) return;
        
        jsb.reflection.callStaticMethod(
            "GameCenterHelper",
            "showLeaderboard:",
            leaderboardId || ""
        );
    }
    
    showAchievements() {
        if (!this._authenticated) return;
        
        jsb.reflection.callStaticMethod(
            "GameCenterHelper",
            "showAchievements"
        );
    }
}
```

### Android Google Play Services
```typescript
@ccclass('GooglePlayManager')
export class GooglePlayManager extends Component {
    @property
    enablePlayGames: boolean = true;
    
    @property
    enableCloudSave: boolean = true;
    
    private _signedIn: boolean = false;
    
    onLoad() {
        if (sys.platform === sys.Platform.ANDROID) {
            this.initializePlayServices();
        }
    }
    
    private async initializePlayServices() {
        try {
            await this.signIn();
            this._signedIn = true;
            
            this.node.emit('playservices-ready');
        } catch (error) {
            console.error('Google Play Services initialization failed:', error);
        }
    }
    
    private async signIn(): Promise<void> {
        return new Promise((resolve, reject) => {
            if (sys.isNative && sys.platform === sys.Platform.ANDROID) {
                jsb.reflection.callStaticMethod(
                    "org/cocos2dx/javascript/GooglePlayHelper",
                    "signIn",
                    "()V"
                );
                
                // Wait for sign-in result
                this.scheduleOnce(() => {
                    if (this.isSignedIn()) {
                        resolve();
                    } else {
                        reject(new Error('Sign-in failed'));
                    }
                }, 3.0);
            } else {
                reject(new Error('Not supported on this platform'));
            }
        });
    }
    
    private isSignedIn(): boolean {
        if (sys.isNative && sys.platform === sys.Platform.ANDROID) {
            return jsb.reflection.callStaticMethod(
                "org/cocos2dx/javascript/GooglePlayHelper",
                "isSignedIn",
                "()Z"
            );
        }
        return false;
    }
    
    async submitScore(leaderboardId: string, score: number): Promise<void> {
        if (!this._signedIn) return;
        
        jsb.reflection.callStaticMethod(
            "org/cocos2dx/javascript/GooglePlayHelper",
            "submitScore",
            "(Ljava/lang/String;J)V",
            leaderboardId,
            score
        );
    }
    
    async unlockAchievement(achievementId: string): Promise<void> {
        if (!this._signedIn) return;
        
        jsb.reflection.callStaticMethod(
            "org/cocos2dx/javascript/GooglePlayHelper",
            "unlockAchievement",
            "(Ljava/lang/String;)V",
            achievementId
        );
    }
    
    async saveGameData(data: string): Promise<boolean> {
        if (!this._signedIn || !this.enableCloudSave) return false;
        
        return new Promise((resolve) => {
            jsb.reflection.callStaticMethod(
                "org/cocos2dx/javascript/GooglePlayHelper",
                "saveGameData",
                "(Ljava/lang/String;)Z",
                data
            );
            resolve(true);
        });
    }
    
    async loadGameData(): Promise<string> {
        if (!this._signedIn || !this.enableCloudSave) return null;
        
        return jsb.reflection.callStaticMethod(
            "org/cocos2dx/javascript/GooglePlayHelper",
            "loadGameData",
            "()Ljava/lang/String;"
        );
    }
}
```

## Cross-Platform Input System

### Unified Input Manager
```typescript
export enum InputType {
    TOUCH = 'touch',
    MOUSE = 'mouse',
    KEYBOARD = 'keyboard',
    GAMEPAD = 'gamepad'
}

@ccclass('CrossPlatformInputManager')
export class CrossPlatformInputManager extends Component {
    @property
    enableTouchInput: boolean = true;
    
    @property
    enableKeyboardInput: boolean = true;
    
    @property
    enableGamepadInput: boolean = true;
    
    private _availableInputs: Set<InputType> = new Set();
    private _primaryInput: InputType = InputType.TOUCH;
    
    onLoad() {
        this.detectAvailableInputs();
        this.setupInputHandlers();
        this.adaptUIForInput();
    }
    
    private detectAvailableInputs() {
        // Touch support
        if (sys.isMobile || 'ontouchstart' in window) {
            this._availableInputs.add(InputType.TOUCH);
            this._primaryInput = InputType.TOUCH;
        }
        
        // Mouse support
        if (!sys.isMobile || sys.platform === sys.Platform.DESKTOP_BROWSER) {
            this._availableInputs.add(InputType.MOUSE);
            if (this._primaryInput === InputType.TOUCH && !sys.isMobile) {
                this._primaryInput = InputType.MOUSE;
            }
        }
        
        // Keyboard support
        if (this.enableKeyboardInput && 
            (sys.platform === sys.Platform.DESKTOP_BROWSER || 
             sys.platform === sys.Platform.WIN32 || 
             sys.platform === sys.Platform.MACOS)) {
            this._availableInputs.add(InputType.KEYBOARD);
        }
        
        // Gamepad support
        if (this.enableGamepadInput && this.hasGamepadSupport()) {
            this._availableInputs.add(InputType.GAMEPAD);
        }
    }
    
    private setupInputHandlers() {
        // Touch input
        if (this._availableInputs.has(InputType.TOUCH)) {
            this.node.on(Node.EventType.TOUCH_START, this.onTouchStart, this);
            this.node.on(Node.EventType.TOUCH_MOVE, this.onTouchMove, this);
            this.node.on(Node.EventType.TOUCH_END, this.onTouchEnd, this);
        }
        
        // Mouse input
        if (this._availableInputs.has(InputType.MOUSE)) {
            this.node.on(Node.EventType.MOUSE_DOWN, this.onMouseDown, this);
            this.node.on(Node.EventType.MOUSE_MOVE, this.onMouseMove, this);
            this.node.on(Node.EventType.MOUSE_UP, this.onMouseUp, this);
            this.node.on(Node.EventType.MOUSE_WHEEL, this.onMouseWheel, this);
        }
        
        // Keyboard input
        if (this._availableInputs.has(InputType.KEYBOARD)) {
            systemEvent.on(SystemEvent.EventType.KEY_DOWN, this.onKeyDown, this);
            systemEvent.on(SystemEvent.EventType.KEY_UP, this.onKeyUp, this);
        }
        
        // Gamepad input
        if (this._availableInputs.has(InputType.GAMEPAD)) {
            this.setupGamepadInput();
        }
    }
    
    private adaptUIForInput() {
        const uiElements = this.node.getComponentsInChildren('Button');
        
        switch (this._primaryInput) {
            case InputType.TOUCH:
                this.optimizeForTouch(uiElements);
                break;
            case InputType.MOUSE:
                this.optimizeForMouse(uiElements);
                break;
            case InputType.GAMEPAD:
                this.optimizeForGamepad(uiElements);
                break;
        }
    }
    
    private optimizeForTouch(elements: any[]) {
        elements.forEach(element => {
            // Increase touch target size
            const button = element.getComponent(Button);
            if (button) {
                const node = button.node;
                const minSize = 44; // iOS HIG minimum
                
                if (node.width < minSize) node.width = minSize;
                if (node.height < minSize) node.height = minSize;
            }
        });
        
        // Show virtual controls if needed
        this.showVirtualControls();
    }
    
    private optimizeForMouse(elements: any[]) {
        elements.forEach(element => {
            const button = element.getComponent(Button);
            if (button) {
                // Add hover effects
                this.addHoverEffect(button);
                
                // Add cursor pointer
                this.addCursorPointer(button);
            }
        });
        
        // Hide virtual controls
        this.hideVirtualControls();
    }
    
    private optimizeForGamepad(elements: any[]) {
        // Setup gamepad navigation
        this.setupGamepadNavigation(elements);
        
        // Show gamepad button hints
        this.showGamepadHints();
    }
}
```

## Store Submission Preparation

### App Store Optimization
```typescript
@ccclass('StoreSubmissionManager')
export class StoreSubmissionManager extends Component {
    @property
    appVersion: string = '1.0.0';
    
    @property
    buildNumber: number = 1;
    
    @property
    targetStores: string[] = ['appstore', 'googleplay'];
    
    async prepareForSubmission(store: string): Promise<SubmissionPackage> {
        const package: SubmissionPackage = {
            store,
            version: this.appVersion,
            buildNumber: this.buildNumber,
            assets: {},
            metadata: {},
            compliance: {},
            buildSettings: {}
        };
        
        switch (store) {
            case 'appstore':
                await this.prepareAppStoreSubmission(package);
                break;
            case 'googleplay':
                await this.prepareGooglePlaySubmission(package);
                break;
            case 'steam':
                await this.prepareSteamSubmission(package);
                break;
        }
        
        return package;
    }
    
    private async prepareAppStoreSubmission(package: SubmissionPackage) {
        // Required assets for App Store
        package.assets = {
            appIcon: await this.generateAppIcons(),
            launchImages: await this.generateLaunchImages(),
            screenshots: await this.generateScreenshots('ios'),
            privacyPolicy: this.getPrivacyPolicyURL()
        };
        
        // App Store metadata
        package.metadata = {
            name: this.getAppName(),
            subtitle: this.getAppSubtitle(),
            description: this.getAppDescription(),
            keywords: this.getAppKeywords(),
            category: this.getAppCategory(),
            ageRating: this.getAgeRating(),
            supportURL: this.getSupportURL(),
            marketingURL: this.getMarketingURL()
        };
        
        // App Store compliance
        package.compliance = {
            usesEncryption: this.usesEncryption(),
            usesIDFA: this.usesIDFA(),
            hasInAppPurchases: this.hasInAppPurchases(),
            hasSubscriptions: this.hasSubscriptions(),
            accessesLocation: this.accessesLocation(),
            accessesCamera: this.accessesCamera(),
            accessesMicrophone: this.accessesMicrophone()
        };
        
        // iOS build settings
        package.buildSettings = {
            bundleId: this.getBundleId(),
            teamId: this.getTeamId(),
            provisioningProfile: this.getProvisioningProfile(),
            codeSigningIdentity: this.getCodeSigningIdentity(),
            architectures: ['arm64'],
            minimumIOSVersion: '12.0',
            deviceFamily: [1, 2] // iPhone and iPad
        };
    }
    
    private async prepareGooglePlaySubmission(package: SubmissionPackage) {
        // Required assets for Google Play
        package.assets = {
            appIcon: await this.generateAndroidIcons(),
            featureGraphic: await this.generateFeatureGraphic(),
            screenshots: await this.generateScreenshots('android'),
            promoVideo: this.getPromoVideoURL()
        };
        
        // Google Play metadata
        package.metadata = {
            title: this.getAppName(),
            shortDescription: this.getShortDescription(),
            fullDescription: this.getFullDescription(),
            category: this.getGooglePlayCategory(),
            contentRating: this.getContentRating(),
            targetAudience: this.getTargetAudience(),
            contactDetails: this.getContactDetails()
        };
        
        // Google Play compliance
        package.compliance = {
            targetSdkVersion: 33,
            permissions: this.getRequiredPermissions(),
            hasAds: this.hasAdvertising(),
            collectsPersonalData: this.collectsPersonalData(),
            sharesDataWithThirdParty: this.sharesDataWithThirdParty(),
            encryptsDataInTransit: this.encryptsDataInTransit(),
            allowsUserInteraction: this.allowsUserInteraction()
        };
        
        // Android build settings
        package.buildSettings = {
            packageName: this.getPackageName(),
            versionCode: this.buildNumber,
            versionName: this.appVersion,
            minSdkVersion: 21,
            targetSdkVersion: 33,
            architectures: ['arm64-v8a', 'armeabi-v7a'],
            keystore: this.getKeystorePath(),
            keyAlias: this.getKeyAlias()
        };
    }
    
    async generateScreenshots(platform: 'ios' | 'android'): Promise<Screenshot[]> {
        const screenshots: Screenshot[] = [];
        const scenes = this.getScreenshotScenes();
        
        for (const scene of scenes) {
            const resolutions = this.getRequiredResolutions(platform);
            
            for (const resolution of resolutions) {
                const screenshot = await this.captureScreenshot(scene, resolution);
                screenshots.push({
                    scene: scene.name,
                    resolution,
                    path: screenshot.path,
                    platform
                });
            }
        }
        
        return screenshots;
    }
    
    validateSubmissionPackage(package: SubmissionPackage): ValidationResult {
        const issues: ValidationIssue[] = [];
        
        // Validate assets
        if (!package.assets.appIcon) {
            issues.push({ severity: 'error', message: 'App icon is required' });
        }
        
        if (!package.assets.screenshots || package.assets.screenshots.length === 0) {
            issues.push({ severity: 'error', message: 'Screenshots are required' });
        }
        
        // Validate metadata
        if (!package.metadata.name || package.metadata.name.length === 0) {
            issues.push({ severity: 'error', message: 'App name is required' });
        }
        
        if (!package.metadata.description || package.metadata.description.length < 10) {
            issues.push({ severity: 'warning', message: 'Description should be more detailed' });
        }
        
        // Validate compliance
        if (package.store === 'appstore' && package.compliance.usesEncryption === undefined) {
            issues.push({ severity: 'error', message: 'Encryption usage must be declared for App Store' });
        }
        
        return {
            isValid: issues.filter(i => i.severity === 'error').length === 0,
            issues
        };
    }
}
```

## Delegations

### To cocos-build-engineer
Trigger: Platform builds needed
Handoff: "Platform integration ready. Build configuration needed for: [target platforms]"

### To cocos-security-expert
Trigger: Platform security needed
Handoff: "Platform services integrated. Security implementation needed for: [native features]"

### To cocos-performance-optimizer
Trigger: Platform optimization needed
Handoff: "Platform adaptation complete. Performance optimization needed for: [specific platforms]"

### To cocos-analytics-specialist
Trigger: Platform analytics needed
Handoff: "Platform integration done. Analytics tracking needed for: [platform events]"

## Best Practices

1. **Platform Guidelines**: Follow each platform's design and technical guidelines
2. **Performance Profiling**: Test on target devices for each platform
3. **Store Optimization**: Optimize metadata and assets for discoverability
4. **Compliance First**: Ensure all legal and policy requirements are met
5. **Graceful Degradation**: Handle missing features elegantly
6. **Testing Matrix**: Test on representative devices for each platform
7. **Update Strategy**: Plan for platform-specific update mechanisms
8. **Monetization Integration**: Implement platform-appropriate monetization