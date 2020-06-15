#import "WYZQPersonInfoViewController.h"
#import "MBProgressHUD.h"
#import "GlobalFunction.h"
#import "WYZQPersonEditViewController.h"
@interface WYZQPersonInfoViewController ()<UINavigationControllerDelegate, UIActionSheetDelegate,  UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end
@implementation WYZQPersonInfoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账户信息";
    [self addBackBtn];
    [self.topView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.topView.frame.size.height)];
    self.headerImageView.layer.masksToBounds = YES;
    self.headerImageView.layer.cornerRadius = self.headerImageView.frame.size.height/2.0;
    UserInfo *user = [UserManger currentLoggedInUser];
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.avatar] placeholderImage:PlaceholderImage];
    self.nameLabel.text = user.nickname;
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"image/base64"];
}
- (IBAction)touxiangPress {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"选择图片做为头像"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"拍照", @"本地相册",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.navigationController.topViewController.view];
}
- (IBAction)namePress {
    WYZQPersonEditViewController *viewCon = [[WYZQPersonEditViewController alloc] initWithNibName:@"WYZQPersonEditViewController" bundle:nil];
    viewCon.nameStr = self.nameLabel.text;
    viewCon.RefreshHandle = ^(NSString * _Nonnull content) {
        self.nameLabel.text = content;
    };
    CustomNavigationCoutroller *navCon = [[CustomNavigationCoutroller alloc] initWithRootViewController:viewCon];
    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController presentViewController:navCon animated:YES completion:nil];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self changeHeadPortraitCamera];
    }else if(buttonIndex == 1) {
        [self changeHeadPortraitFromPicture];
    }
}
#pragma mark 拍照
-(void)changeHeadPortraitCamera
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    [self addImagePickerController:sourceType];
}
#pragma mark 从相册中选取
-(void)changeHeadPortraitFromPicture
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self addImagePickerController:sourceType];
}
#pragma mark 选择相册
-(void)addImagePickerController:(UIImagePickerControllerSourceType )sourceType
{
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = sourceType;
    [self.navigationController.topViewController presentViewController:picker animated:YES completion:nil];
}
#pragma mark 选择相册完毕
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    self.headerImageView.image = image;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = @"正在保存";
    [[ServiceRequest sharedService] POSTJSON:@"image/base64" parameters:@{@"base64String":reSizeImageData(image, 0, 0)} success:^(id responseObject) {
        NSString *imageUrl = [responseObject objectForKey:@"uploadFileUrl"];
        UserInfo *user = [UserManger currentLoggedInUser];
        [[ServiceRequest sharedService] PUTJSON:[NSString stringWithFormat:@"user/%@", user.userID] parameters:@{@"avatar":imageUrl} success:^(id responseObject) {
            [hud hideAnimated:YES];
            user.avatar = imageUrl;
            [UserManger setUser:user];
        } failure:^(NSString *error, NSInteger code) {
            [hud hideAnimated:YES];
            [self showHUDAlert:error];
        }];
    } failure:^(NSString *error, NSInteger code) {
        [hud hideAnimated:YES];
        [self showHUDAlert:error];
    } update:^(float progress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            hud.progress = progress;
        });
    }];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
