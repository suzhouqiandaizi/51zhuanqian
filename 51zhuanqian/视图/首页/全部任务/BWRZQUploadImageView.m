#import "BWRZQUploadImageView.h"
#import "AppDelegate.h"
#import "MIPhotoBrowser.h"
@interface BWRZQUploadImageView()<UINavigationControllerDelegate, UIActionSheetDelegate,  UIImagePickerControllerDelegate, MIPhotoBrowserDelegate>{
}
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;
@end
@implementation BWRZQUploadImageView
- (id)initItem:(CGRect)frame{
    self = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQUploadImageView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:frame];
        self.removeBtn.hidden = YES;
        self.hasChoose = NO;
    }
    return self;
}
- (IBAction)uploadPress {
    if (self.imageUrl.length > 0) {
        MIPhotoBrowser *photoBrowser = [[MIPhotoBrowser alloc] init];
        photoBrowser.delegate = self;
        photoBrowser.sourceImagesContainerView = self.contentImageView.superview;
        photoBrowser.currentImgaeView = self.contentImageView;
        photoBrowser.imageCount = 1;
        photoBrowser.currentImageIndex = 0;
        [photoBrowser show];
    }else{
        UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:@"选择图片上传"
                                      delegate:self
                                      cancelButtonTitle:@"取消"
                                      destructiveButtonTitle:nil
                                      otherButtonTitles:@"拍照", @"本地相册",nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [actionSheet showInView:del.navigationController.topViewController.view];
    }
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
    picker.allowsEditing = NO;
    picker.sourceType = sourceType;
    AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [del.navigationController.topViewController presentViewController:picker animated:YES completion:nil];
}
#pragma mark 选择相册完毕
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
    self.contentImageView.image = image;
    self.removeBtn.hidden = NO;
    self.jiaLabel.hidden = YES;
    self.infoLabel.hidden = YES;
    if ([self.delegate respondsToSelector:@selector(addUploadImageView:)]) {
        self.hasChoose = YES;
        [self.delegate addUploadImageView:self];
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)removePress {
    if ([self.delegate respondsToSelector:@selector(removeUploadImageView:)]) {
        [self.delegate removeUploadImageView:self];
    }
}
- (void)showContentImageView:(NSString *)imageUrl{
    self.imageUrl = imageUrl;
    [self.contentImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:PlaceholderImage];
    self.removeBtn.hidden = NO;
    self.jiaLabel.hidden = YES;
    self.infoLabel.hidden = YES;
    self.hasChoose = YES;
}
- (UIImage *)photoBrowser:(MIPhotoBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index{
    return self.contentImageView.image;
}
@end
