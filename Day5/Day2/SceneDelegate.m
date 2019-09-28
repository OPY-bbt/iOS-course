#import "SceneDelegate.h"
#import "ViewController.h"
#import "VideoViewController.h"
#import "ScrollViewController.h"

@interface SceneDelegate ()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    UITabBarController *tabbarController = [[UITabBarController alloc] init];

    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationController.view.backgroundColor = [UIColor whiteColor];
    navigationController.tabBarItem.title = @"xinwen";
    navigationController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home"];
    navigationController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected"];

    VideoViewController *controller2 = [[VideoViewController alloc] init];
    controller2.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like"];
    controller2.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected"];

    ScrollViewController *controller3 = [[ScrollViewController alloc] init];
    controller3.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page"];
    controller3.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected"];

    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor yellowColor];
    controller4.tabBarItem.title = @"wode";
    controller4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video"];
    controller4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected"];

    [tabbarController setViewControllers:@[navigationController, controller2, controller3, controller4]];
    
    tabbarController.delegate = self;

    self.window.rootViewController = tabbarController;

    [self.window makeKeyAndVisible];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"did select");
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
