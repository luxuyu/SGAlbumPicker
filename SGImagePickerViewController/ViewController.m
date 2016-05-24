//
//  ViewController.m
//  SGImagePickerViewController
//
//  Created by 58同城－卢旭宇 on 16/4/27.
//  Copyright © 2016年 拾光. All rights reserved.
//

#import "ViewController.h"

#import "SGAlbumPickerController.h"

@interface ViewController ()<UINavigationControllerDelegate,SGAlbumPickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showImagePicker:(id)sender {
    
    
    
    SGAlbumPickerController * picker = [[SGAlbumPickerController alloc] init];
    
//    if (picker.havePhotosPermissions == NO) {
//        NSLog(@"没有相册权限");
//        return;
//    }
    picker.delegate = self;
    picker.maximumNumberOfSelection = 5;
    picker.showPhoto = YES;
    picker.showVideo = YES;
    picker.showEmptyAlbum = NO;
    picker.showNewPhotoInFront = YES;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
    
}

-(void)albumPickerController:(SGAlbumPickerController *)picker didFinishPickingPhotos:(NSArray *)photos{
    
    NSLog(@"%@",photos);
    for (SGPhotoModel * model in photos) {
        _imageView.image = model.fullResolutionImage;
    }
}

-(void)albumPickerControllerDidCancel:(SGAlbumPickerController *)picker{
    
    NSLog(@"cancel");

}

-(void)albumPickerController:(SGAlbumPickerController *)picker didSelectPhoto:(SGPhotoModel*)photo{
    
    NSLog(@"%@",photo);

}

-(void)albumPickerController:(SGAlbumPickerController *)picker didDeselectPhoto:(SGPhotoModel*)photo{
    
    NSLog(@"%@",photo);

}

-(void)albumPickerControllerDidMaximum:(SGAlbumPickerController *)picker{
    
    NSLog(@"最大数量了");

}

@end
