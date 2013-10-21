//
//  FrontViewController.m
//  Noted7
//
//  Created by Cecilia Zhang on 10/16/13.
//  Copyright (c) 2013 Cecilia Zhang. All rights reserved.
//


static const CGFloat textHeight = 20.0f;
static const CGFloat textPadding = 29.0f;

#import "FrontViewController.h"
#import "CustomTextCell.h"
#import "CustomCellContent.h"
#import "DAKeyboardControl.h"

#define CustomTextCell_ID_ @"Custom Text Cell"

@interface FrontViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    
    UITextView *currentlyEditingTextView; // keeping track of the currently editing textview (for the ability to use resignFirstResponder elsewhere)

}
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong) UIToolbar *toolbar;
@end

@implementation FrontViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void) loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
 
    [self.view addSubview:self.tableView];
    
    self.toolbar = [self setUpToolbarAccessoryView];
    [self.view addSubview:self.toolbar];

}

-(void) viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    self.tableView.autoresizingMask = ( UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth );
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];
    
    
    self.toolbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    self.view.keyboardTriggerOffset = self.toolbar.bounds.size.height;
    
    __weak typeof(self) weakSelf = self;
    [self.view addKeyboardPanningWithActionHandler:^(CGRect keyboardFrameInView) {
        /*
         Try not to call "self" inside this block (retain cycle).
         But if you do, make sure to remove DAKeyboardControl
         when you are done with the view controller by calling:
         [self.view removeKeyboardControl];
         */
        
        CGRect toolBarFrame = weakSelf.toolbar.frame;
        toolBarFrame.origin.y = keyboardFrameInView.origin.y - toolBarFrame.size.height;
        weakSelf.toolbar.frame = toolBarFrame;
        
        
        CGRect tableViewFrame = weakSelf.tableView.frame;
        tableViewFrame.size.height = toolBarFrame.origin.y;
        weakSelf.tableView.frame = tableViewFrame;
    }];
    
}

-(void) viewWillAppear:(BOOL)animated {
     [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

-(void)viewDidAppear:(BOOL)animated {
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark UITableViewDataSource methods 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  
    static NSString *CellIdent = @"CustomTextCellIdent";
    CustomTextCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdent];
    if (!cell) {
        cell = [[CustomTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CustomTextCell_ID_];
    }
    cell.backgroundColor = [UIColor greenColor];
    
    CustomTextContent *textContent = [[CustomTextContent alloc] init];
    textContent.textValue = @"TODO: to change temporary value ";
    [textContent setupCell:cell];
    
    
    //first cell
    if(indexPath.row == 0 && indexPath.section == 0) {
       [cell.customTextView becomeFirstResponder];
        cell.customTextView.delegate = self;
    }
 
    return cell;
}

#pragma mark UITableViewDelegate method

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *textString    = @"Needs to be changed "; //notebody.body;
    //CGSize cellSize         = [textString sizeWithFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size: 15.0f] constrainedToSize:CGSizeMake(320, 99999) lineBreakMode:NSLineBreakByWordWrapping];
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIFont fontWithName:@"HelveticaNeue-Medium" size:15.0f], NSFontAttributeName,
                                          nil];
   
    CGRect cellRect = [textString boundingRectWithSize:CGSizeMake(320, 99999) options:NSStringDrawingUsesFontLeading attributes:attributesDictionary context:Nil];
    CGSize cellSize = cellRect.size;
    CGFloat HEIGHT          = cellSize.height + textPadding;
    
    
    if([textString hasSuffix:@"\n"] || [textString length] == 0)
    {
        HEIGHT += textHeight;
    }
    
    HEIGHT += 200.0f;
    
//    if(indexPath.row == ([self.noteBodies count] - 1))
//    {
//        HEIGHT += 200.0f;
//    }
    return HEIGHT;

}



#pragma  mark UITextView delegate methods

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    currentlyEditingTextView        = textView;
    // self.doneButton.hidden          = FALSE;
    
    //add  accessoryview
       //currentlyEditingTextView.inputAccessoryView = toolbar;
    
    return YES;
}


- (void)textViewDidChange:(UITextView *)textView
{
    [self.tableView        beginUpdates];
    CustomTextCell *cell        = (CustomTextCell *)textView.superview.superview;
    NSIndexPath *indexpath      = [self.tableView indexPathForRowAtPoint:cell.center];
    NSInteger i                 = indexpath.row;
//    NoteBody    *notebody       = [self.noteBodies objectAtIndex:i];
//    notebody.body               = (NSMutableString *)textView.text;
//    [self.noteBodies            replaceObjectAtIndex:i withObject:notebody];
    [self.tableView       endUpdates];
}


-(void)textViewDidBeginEditing:(UITextView *)textView
{
    currentlyEditingTextView        = textView;
   // self.doneButton.hidden          = FALSE;
    

}




- (void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
//    self.localNoteInfo.lastEditedNoteDate = [NSDate date];
//    [[CoreDataHelper shared] saveContext];
//    self.noteBodies = [[CoreDataHelper shared] fetchEntityFromCoreData:@"NoteBody" uniqueIdentity:self.uniqueIdentity];
//    [self writeNoteBodyToFile:self.noteBodies];
//    self.doneButton.hidden = TRUE;
}

#pragma mark toolbar accessoryview 

-(UIToolbar *) setUpToolbarAccessoryView {
    UIToolbar *toolBar =[[UIToolbar alloc] initWithFrame:CGRectMake(0.0f,
                                                                    self.view.bounds.size.height - 40.0f,
                                                                    self.view.bounds.size.width,
                                                                    40.0f)];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:toolBar];
    
    
    UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *cameraImg = [UIImage imageNamed:@"camera24"];
    [imageButton setBackgroundImage:cameraImg forState:UIControlStateNormal];
    imageButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    imageButton.frame = CGRectMake(toolBar.bounds.size.width - 40.0f,
                                   8.0f,
                                   cameraImg.size.width,
                                   cameraImg.size.height);
    [imageButton addTarget:self action:@selector(imageButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolBar addSubview:imageButton];
    
    self.view.keyboardTriggerOffset = toolBar.bounds.size.height;
    
    
    return toolBar;
}

-(void)imageButtonClicked:(id)sender {
    
    //dismiss keyboard first
    
   [self.view hideKeyboard];
    
    UIImagePickerController * picker    = [[UIImagePickerController alloc] init];
    picker.delegate                     = self;
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        [self presentViewController:picker animated:YES completion:Nil];
    
    }
}

#pragma mark  UIImagePickerControllerdelegate methods

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editingInfo
{
   [picker dismissViewControllerAnimated:YES completion:^{
       
      
       
   }];

    
//    CGFloat scalePortion;
//    scalePortion = img.size.width > CellBoundWidth ? CellBoundWidth/img.size.width : 1.0;
//    
//    //UIGraphicsBeginImageContext(size);
//    UIGraphicsBeginImageContextWithOptions(img.size, NO, scalePortion);
//    [img drawInRect:        CGRectMake(10.0f, 0.0f, img.size.width, img.size.height)];
//    UIImage *resizedImage   = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    // save image to file
//    NSString *directoryPath     = [[CoreDataHelper shared] getImageFolderPath];//[self getImageFolderPath];
//    NSString *imageFileName     = [NSString stringWithFormat:@"%i", arc4random()%0xFFFFFFFF];
//    NSString *imageFilePath     = [directoryPath stringByAppendingPathComponent:imageFileName];
//    
//    [UIImageJPEGRepresentation(resizedImage, 1.0) writeToFile:imageFilePath atomically:YES];
//    
//    __block NSMutableArray *orderarray = [NSMutableArray array];
//    [self.noteBodies enumerateObjectsUsingBlock:^(NoteBody *notebody, NSUInteger idx, BOOL *stop) {
//        [orderarray addObject:notebody.order];
//    }];
//    int max = [[orderarray valueForKeyPath:@"@max.intValue"] intValue];
//    
//    // get image path and put to coredata
//    __block NoteBody *_notebody;
//    [[CoreDataHelper shared] createEntity:@"NoteBody" CreationBlock:^(NoteBody *notebody) {
//        _notebody = notebody;
//    }];
//    _notebody.body              = (NSMutableString *)imageFilePath;
//    _notebody.order             = [NSNumber numberWithInteger:max + 1];
//    _notebody.identity          = self.uniqueIdentity;
//    
//    
//    __block NoteBody *_nextnotebody;
//    [[CoreDataHelper shared] createEntity:@"NoteBody" CreationBlock:^(NoteBody *notebody) {
//        _nextnotebody = notebody;
//    }];
//    _nextnotebody.body              = (NSMutableString *)@"";
//    _nextnotebody.order             = [NSNumber numberWithInteger: (max + 2)];
//    _nextnotebody.identity          = self.uniqueIdentity;
//    
//    [self.localNoteInfo.noteBodies addObject:_notebody];
//    [self.localNoteInfo.noteBodies addObject:_nextnotebody];
//    self.localNoteInfo.lastEditedNoteDate   = [NSDate date];
//    [[CoreDataHelper shared] saveContext];
//    
//    self.noteBodies = [[CoreDataHelper shared] fetchEntityFromCoreData:@"NoteBody" uniqueIdentity:self.uniqueIdentity];
//    
//    [self writeNoteBodyToFile:  self.noteBodies];
//    [self.customTableView       reloadData];
//    
//    NSIndexPath *indexPath  = [NSIndexPath  indexPathForRow: self.noteBodies.count - 1 inSection:0];
//    [self.customTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];


}

@end
