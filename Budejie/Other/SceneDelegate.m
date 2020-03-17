#import "SceneDelegate.h"
#import "BDMeViewController.h"
#import "BDNewViewController.h"
#import "BDFriendViewController.h"
#import "BDPubilcViewController.h"
#import "BDEssenceViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = [UIScreen mainScreen].bounds;
    UITabBarController *tabbarVC = [[UITabBarController alloc] init];
    self.window.rootViewController = tabbarVC;
    [self.window makeKeyAndVisible];
    
    BDEssenceViewController *essenceVC = [[BDEssenceViewController alloc] init];
    UINavigationController *essenceNaviVC = [[UINavigationController alloc] initWithRootViewController:essenceVC];
    [tabbarVC addChildViewController:essenceNaviVC];
    
    BDMeViewController *meVC = [[BDMeViewController alloc] init];
    UINavigationController *meNaviVC = [[UINavigationController alloc] initWithRootViewController:meVC];
    [tabbarVC addChildViewController:meNaviVC];
    
    BDNewViewController *newVC = [[BDNewViewController alloc] init];
    UINavigationController *newNaviVC = [[UINavigationController alloc] initWithRootViewController:newVC];
    [tabbarVC addChildViewController:newNaviVC];
    
    BDFriendViewController *friendVC = [[BDFriendViewController alloc] init];
    UINavigationController *friendNaviVC = [[UINavigationController alloc] initWithRootViewController:friendVC];
    [tabbarVC addChildViewController:friendNaviVC];
    
    BDPubilcViewController *pubilcVC = [[BDPubilcViewController alloc] init];
    [tabbarVC addChildViewController:pubilcVC];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
